class HardWorker
	include Sidekiq::Worker

	def perform(user_id)
    current_user = User.find(user_id)
    friends = current_user.facebook.get_connections("me", "friends")
		friends.each do |friend|
			puts "Found friend!!!!!!"
			picture = current_user.facebook.get_picture(friend['id'])
			name = friend['name']
			id = friend['id']
			current_user.friends.find_or_create_by_facebook_id_and_user_id(profile_picture: picture, username: name, facebook_id: id)
		end

		posts = current_user.facebook.get_connections("me", "posts")
    friends = current_user.friends
    likes = []
    next_page = posts.next_page
    while !next_page.to_a.empty?
    	puts "Found posts!!!!!"
      posts += next_page
      next_page = next_page.next_page
    end

    posts.each do |post|
      if post['likes']
        likes << post['likes']['data']
      end
    end
    likes = likes.flatten

    @likes_per_friend = []
    friends.each do |friend|
      @likes_per_friend << {username: friend[:username],
        likes: likes.count { |x| x['id'] == friend[:facebook_id] }}
    end

    sort = @likes_per_friend.sort! { |x,y| y[:likes] <=> x[:likes] }

    top_5 = sort[0..4]

    names = []

    values = []

    top_5.each do |name|
      names << name[:username]
      values << name[:likes]
    end

    @top_5 = [names,values]
    if current_user.user_data
      current_user.user_data.update_attributes({like_data: @top_5.to_s})
    else
      current_user.create_user_data({like_data: @top_5.to_s})
    end
	end
end