# == Schema Information
#
# Table name: visits
#
#  id               :bigint(8)        not null, primary key
#  visitor_id       :integer          not null
#  shortened_url_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Visit < ApplicationRecord 
  belongs_to :user,
    class_name: :User, 
    primary_key: :id, 
    foreign_key: :user_id

  belongs_to :shortened_url,
    class_name: :ShortenedUrl, 
    primary_key: :id, 
    foreign_key: :shortened_url_id

  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user.id, shortened_url: shortened_url.id)
  end 
end 


