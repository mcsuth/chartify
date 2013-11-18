class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
    	t.integer :user_id
    	t.string :like_data
    	t.string :tags_data
    	t.string :sex_data
    	t.string :interests_data
    	t.string :hometown_data
    	t.string :relationship_data
      t.string :likes_data
      t.string :cultured
      t.string :hometowns

      t.timestamps
    end
  end
end
