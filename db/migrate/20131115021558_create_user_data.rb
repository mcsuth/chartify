class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
    	t.integer :user_id
    	t.string :like_data
    	t.string :tags_data
      t.string :likes_data

      t.timestamps
    end
  end
end
