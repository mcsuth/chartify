class HardWorker
	include Sidekiq::Worker

	def perform(user_id)
    current_user = User.find(user_id)

    # add fb friend data to the database
    friends = current_user.facebook.get_connections("me", "friends")
		friends.each do |friend|
			puts "Found friend!!!!!!"
			picture = current_user.facebook.get_picture(friend['id'])
			name = friend['name']
			id = friend['id']
			current_user.friends.find_or_create_by_facebook_id_and_user_id(profile_picture: picture, username: name, facebook_id: id)
		end

		# add fb post data to the database for top five likers chart
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

    # get language data for culture graph
    languages = current_user.facebook.get_connections("me", "friends?fields=languages")
      lingo = []

      languages.each do |language|
        if language["languages"]
          langs = language["languages"]
          langs.each do |lang|
            lingo << lang["name"]
          end
        end
      end

      lingos = lingo.join(" ")
      unique_languages = lingo.join(" ").downcase.split(" ").uniq.sort.count

      result = lingos.split.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

      top_3_langs = result.sort_by{|k,v| -v}.first(3)

      if current_user.user_data
        current_user.user_data.update_attributes({cultured: top_3_langs.to_s})
      else
        current_user.create_user_data({cultured: top_3_langs.to_s})
      end

      # get photos data from fb and add to database for top 5 tagees chart
      photos = current_user.facebook.get_connections("me", "photos")
      friends = current_user.friends
      tags = []

      next_page = photos.next_page
      while !next_page.to_a.empty?
        photos += next_page
        next_page = next_page.next_page
      end

      photos.each do |photo|
        if photo['tags']
          tags << photo['tags']['data']
        end
      end

      tags.flatten!

      @tags_per_friend = []
      friends.each do |friend|
        @tags_per_friend << {username: friend[:username],
          tags: tags.count { |x| x['id'] == friend[:facebook_id]}}
      end

      @tags_per_friend.sort! { |x,y| y[:tags] <=> x[:tags] }
      @tags_per_friend = @tags_per_friend[0..4]

      names = []
      values = []

      @tags_per_friend.each do |name|
        names << name[:username]
        values << name[:tags]
      end

      @top_5 = [names,values]
      if current_user.user_data
        current_user.user_data.update_attributes({tags_data: @top_5.to_s})
      else
        current_user.create_user_data({tags_data: @top_5.to_s})
      end

      # fb stuff for total likes chart
      posts = current_user.facebook.get_connections("me", "posts")
      messages = ""
      likes = []
      next_page = posts.next_page
      while !next_page.to_a.empty?
        posts += next_page
        next_page = next_page.next_page
      end

      posts.each do |post|
        if post['likes']
          likes += post['likes']['data']
        end
      end

      amount = likes.count
      @likes = amount
      if current_user.user_data
        current_user.user_data.update_attributes({likes_data: @likes.to_s})
      else
        current_user.create_user_data({likes_data: @likes.to_s})
      end

      # fb stuff for shit you like chart
      music = current_user.facebook.get_connections("me", "music").count
      books = current_user.facebook.get_connections("me", "books").count
      movies = current_user.facebook.get_connections("me", "movies").count
      @user_likes = { music: music, books: books, movies: movies }
      if current_user.user_data
        current_user.user_data.update_attributes({interests_data: @user_likes.to_s})
      else
        current_user.create_user_data({interests_data: @user_likes.to_s})
      end

      # fb stuff for hometowns chart
      hometowns = current_user.facebook.get_connections("me", "friends?fields=location")
      home = []

      hometowns.each do |hometown|
        if hometown["location"]
          home << hometown["location"]["name"]
        end
      end

      hashoflocations = home.sort.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      sorted = hashoflocations.sort_by{|k,v| -v}.first(3)
      x = current_user.friends.count
      y = home.count


      x = current_user.friends.count
      y = home.count

      # Place Names
      names = []
      numbers = []

      total = sorted[0][1] + sorted[1][1] + sorted[2][1]
      othernum = ( y - total)

      names << [sorted[0][0]]
      names  << [sorted[1][0]]
      names << [sorted[2][0]]
      names << ["The Middle of Nowhere"]

      numbers << ([sorted[0][1]])
      numbers  << [sorted[1][1]]
      numbers << [sorted[2][1]]
      numbers << [othernum]
      @hash = { top_places: names, number: numbers}
      if current_user.user_data
        current_user.user_data.update_attributes({hometown_data: @hash.to_s})
      else
        current_user.create_user_data({hometown_data: @hash.to_s})
      end

      # fb stuff for relationship chart
      relationships = current_user.facebook.get_connections("me", "friends?fields=name,gender,relationship_status")
      love = []
      relationships.each do |relationship|
        if relationship["relationship_status"]
          love << relationship["relationship_status"]
        end
      end

      relation = love.join(",")
      status = relation.split(",").inject(Hash.new(0)) { |h,v| h[v] += 1; h }

      if current_user.user_data
        current_user.user_data.update_attributes({relationship_data: status.to_s})
      else
        current_user.create_user_data({relationship_data: status.to_s})
      end

      # fb stuff for gender chart
      genders = current_user.facebook.get_connections("me", "friends?fields=name,gender")
      sex = []
      genders.each do |gender|
        if gender["gender"]
          sex << gender["gender"]
        end
      end
      numfriends = current_user.friends[1]["id"]

      male = sex.count("male").to_f/numfriends.to_f
      female = sex.count("female").to_f/numfriends.to_f

      @gender = {'males'=> male.round(2), 'females'=> female.round(2)}
      if current_user.user_data
        current_user.user_data.update_attributes({sex_data: @gender.to_s.gsub("=>",":")})
      else
        current_user.create_user_data({sex_data: @gender})
      end
	end # end perform
end