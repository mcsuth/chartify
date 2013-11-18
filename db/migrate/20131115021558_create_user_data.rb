class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
    	t.integer :user_id
    	t.string :like_data
    	t.string :tags_data
<<<<<<< HEAD
      t.string :likes_data
=======
      t.string :cultured
      t.string :hometowns
>>>>>>> d3979869d4cae2b4ac9edff7858ad1ea723ed7b6

      t.timestamps
    end
  end
end
