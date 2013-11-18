class UserData < ActiveRecord::Base
  attr_accessible :user_id, :like_data

  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
end
