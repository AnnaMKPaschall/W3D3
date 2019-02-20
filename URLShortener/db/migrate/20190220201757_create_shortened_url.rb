class CreateShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false
      t.text :long_url, null: false, unique: true
      t.text :short_url, null: false, unique: true
      t.timestamps 
    end
    add_index :shortened_urls, :long_url, unique: true
  end

end
