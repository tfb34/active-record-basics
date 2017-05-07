#creating associated after models have been set.
#1. declare type of association(ex. has_many or belongs_to, etc.) in models
#2. add column to table and don't forget to add_index
#3. finally run migration
class AddUserIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id#this line was added manually
  end
end
