class UserData < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :user_id, :like_data, :tags_data, :likes_data
=======
  attr_accessible :user_id, :like_data, :tags_data, :cultured, :hometowns
>>>>>>> d3979869d4cae2b4ac9edff7858ad1ea723ed7b6

  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
end
