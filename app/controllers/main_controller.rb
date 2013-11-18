class MainController < ApplicationController

  def index
    unless current_user
      redirect_to login_path
    end
  end

  def login

  end

  def user_data
  	posts = current_user.facebook.get_connections("me", "posts")
  	messages = ""
  	likes = []
  	next_page = posts.next_page
  	while !next_page.to_a.empty?
  		posts += next_page
  		next_page = next_page.next_page
  	end

  	posts.each do |post|
  		if post['message']
  			messages += post['message']
  		end
  		if post['likes']
  			likes += post['likes']['data']
  		end
  	end

  	@data = {messages: messages, likes: likes}
  	render json: @data
  end

  def json
    # render "data"
    @friends = current_user.friends
    render json: @friends
  end

  def friends_on_chartify
    users = User.all - [current_user]
    friends = current_user.friends

    @friends_on_chartify = []
    friends.each do |friend|
      users.each do |user|
        if friend['facebook_id'] == user['uid']
          @friends_on_chartify << friend
        end
      end
    end

    render json: @friends_on_chartify
  end

  def friends_off_chartify
    users = User.all - [current_user]
    friends = current_user.friends

    friends_on_chartify = []
    friends.each do |friend|
      users.each do |user|
        if friend['facebook_id'] == user['uid']
          friends_on_chartify << friend
        end
      end
    end

    @friends_off_chartify = friends - friends_on_chartify

    render json: @friends_off_chartify
  end

  def likes_per_friend
    # if looking at a friends charts render the friends data
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.like_data
    else
      posts = current_user.facebook.get_connections("me", "posts")
      friends = current_user.friends
      likes = []
      next_page = posts.next_page
      while !next_page.to_a.empty?
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
      render json: @top_5
    end
  end

  def tags_per_friend
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
    render json: @top_5
  end


  def likes
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
    render json: @likes
  end



  def comments
    posts = current_user.facebook.get_connections("me", "posts")
    messages = ""
    comments = []
    next_page = posts.next_page
    while !next_page.to_a.empty?
      posts += next_page
      next_page = next_page.next_page
    end

    posts.each do |post|
      if post['comments']
        comments += post['comments']['data']
      end
    end


    @total = comments.length
    render json: @total
  end



  def vulgar
    posts = current_user.facebook.get_connections("me", "posts")
    messages = ""
    next_page = posts.next_page

    while !next_page.to_a.empty?
      posts += next_page
      next_page = next_page.next_page
    end

    posts.each do |post|
      if post['message']
        messages += post['message']
      end
    end

    fucks = messages.upcase.split(" ").count("FUCK")
    shits = messages.upcase.split(" ").count("SHIT")
    cunts = messages.upcase.split(" ").count("CUNT")
    mfucker = messages.upcase.split(" ").count("MOTHER FUCKER")

    @messages = {fucks: fucks, shits: shits, cunts: cunts, mfucker: mfucker}
    render json: @messages
  end


  def funny
    posts = current_user.facebook.get_connections("me", "posts")
    messages = ""
    next_page = posts.next_page

    while !next_page.to_a.empty?
      posts += next_page
      next_page = next_page.next_page
    end

    posts.each do |post|
      if post['message']
        messages += post['message']
      end
    end

    funnys = messages.upcase.split(" ").count("FUNNY")
    lols = messages.upcase.split(" ").count("LOL")
    hahas = messages.upcase.split(" ").count("HAHA")
    lmao = messages.upcase.split(" ").count("LMAO")

    @messages = {funnys: funnys, lols: lols, hahas: hahas, lmao: lmao}
    render json: @messages
  end

  def party
    party = current_user.facebook.get_connections("me", "events?since=1349654400")
    events = []
    rsvps = []
    next_page = party.next_page

    while !next_page.to_a.empty?
      party += next_page
      next_page = next_page.next_page
    end

    party.each do |event|
      events << event["name"]
      rsvps << event["rsvp_status"]
    end

    maybe = rsvps.count("unsure")
    yes = rsvps.count("attending")
    no = rsvps.count("decline")
    @data = {maybe: maybe, yes: yes, no: no}
    render json: @data
  end

  def photos
    photos = current_user.facebook.get_connections("me", "photos")
    albums = current_user.facebook.get_connections("me", "albums")

    phot = []
    albs = []
    likes = []

    next_page = photos.next_page

    while !next_page.to_a.empty?
      photos += next_page
      next_page = next_page.next_page

      albums += next_page
      next_page = next_page.next_page
    end

    photos.each do |photo|
      phot << photo["picture"]
    end
    albums.each do |album|
      albs << album["name"]
      if album['likes']
        the_likes = album["likes"]["data"]
        the_likes.each do |each_like|
          likes << each_like["name"]
        end
      end
    end

    photocounts = phot.count
    photolikes = likes.count
    albumcounts = albs.count
    @photos = {how_many_photos_tagged_in: photocounts, num_of_people_who_liked_the_photos_you_posted_on_FB: photolikes, num_of_albums_you_have: albumcounts}
    render json: @photos
  end

  def locations
    friendsevents = current_user.facebook.get_connections("me", "friends?fields=checkins")
    friendcheckins = []
    friendsevents.each do |events|
      friendcheckins << events["id"]
    end

    locations = current_user.facebook.get_connections("me", "checkins")
    places = []
    next_page = locations.next_page
    while !next_page.to_a.empty?
      locations += next_page
      next_page = next_page.next_page
    end
    locations.each do |location|
      places << location["place"]
    end
    # puts friendcheckins

    traveled = places.count
    friendsevent = friendcheckins.count

    @locations = { places_traveled: traveled, friends_travled: friendsevent}
    render json: @locations
  end

  def cultured
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
    # [1][1]
    render json: top_3_langs

  end

  def user_likes
    music = current_user.facebook.get_connections("me", "music").count
    books = current_user.facebook.get_connections("me", "books").count
    movies = current_user.facebook.get_connections("me", "movies").count
    @user_likes = { music: music, books: books, movies: movies }
    render json: @user_likes
  end

  def hometowns
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
    hash = { top_places: names, number: numbers}
    render json: hash

  end

  def love
    relationships = current_user.facebook.get_connections("me", "friends?fields=name,gender,relationship_status")
    love = []
    relationships.each do |relationship|
      if relationship["relationship_status"]
        love << relationship["relationship_status"]
      end
    end

    relation = love.join(",")
    status = relation.split(",").inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    render json: status
  end

  def gender
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

    gender = {males: male.round(2), females: female.round(2)}
    render json: gender
  end

end