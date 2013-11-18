class UserData < ActiveRecord::Base
  attr_accessible :user_id, :like_data, :tags_data, :sex_data, :interests_data, :hometown_data, :relationship_data

  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
end
