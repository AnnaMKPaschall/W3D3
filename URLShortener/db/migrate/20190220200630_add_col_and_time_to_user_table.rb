class AddColAndTimeToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :timestamps, :float
    add_index :users, :email, unique: true
  end
end
