class HardWorker
	include Sidekiq::Worker

	def perform(user_id)
    current_user = User.find(user_id)
    friends = current_user.facebook.get_connections("me", "friends")
		friends.each do |friend|
			puts "Found a friend!!!!!!!!"
			picture = user.facebook.get_picture(friend['id'])
			name = friend['name']
			id = friend['id']
			current_user.friends.find_or_create_by_facebook_id_and_user_id(profile_picture: picture, username: name, facebook_id: id)
		end
	end
end