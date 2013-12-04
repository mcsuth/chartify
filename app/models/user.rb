class User < ActiveRecord::Base

	has_many :friends
	has_one :user_data

	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.profile_picture = user.facebook.get_picture("me")
			friends = user.facebook.get_connections("me", "friends")
			friends.each do |friend|
				picture = user.facebook.get_picture(friend['id'])
				name = friend['name']
				id = friend['id']
				user.friends.find_or_create_by_facebook_id_and_user_id(profile_picture: picture, username: name, facebook_id: id)
			end
			
			user.save!
		end

	end

	def facebook
		@facebook ||= Koala::Facebook::API.new(oauth_token)
	end
end
