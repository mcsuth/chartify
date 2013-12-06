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
			
			
			user.save!
		end

	end

	def facebook
		@facebook ||= Koala::Facebook::API.new(oauth_token)
	end
end
