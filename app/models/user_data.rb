class UserData < ActiveRecord::Base
  attr_accessible :user_id, :user_data

  belongs_to :user

  validates :user_id, presence: true
end
