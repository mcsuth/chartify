class Friend < ActiveRecord::Base
  attr_accessible :profile_picture, :username, :facebook_id, :user_id

  belongs_to :user
end
