# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  long_url   :text             not null
#  short_url  :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord 
  validates :long_url, presence: true, uniqueness: true

  def self.random_code 
    rand_code = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(rand_code)
      rand_code = SecureRandom.urlsafe_base64
    end 

    rand_code
  end

  def self.shorten(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  belongs_to :submitter, 
    class_name: :User, 
    primary_key: :id, 
    foreign_key: :user_id

  has_many :visits, 
   class_name: :Visit, 
   primary_key: :id, 
   foreign_key: :shortened_url_id

   has_many :visitors, 
   through: :visits, 
   source: :user 

end 
