class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
    	t.string :profile_picture
    	t.string :username
    	t.string :facebook_id
    	t.integer :user_id

      t.timestamps
    end
  end
end
