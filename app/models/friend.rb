class Friend < ActiveRecord::Base
  attr_accessible :profile_picture, :username, :facebook_id, :user_id

  belongs_to :user

  validates :facebook_id, uniqueness: { :scope => :user_id }
end
