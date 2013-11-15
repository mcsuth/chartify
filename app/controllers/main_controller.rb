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
  	while !next_page.empty?
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

 def vulgar
    posts = current_user.facebook.get_connections("me", "posts")
    messages = ""
    # likes = []
    next_page = posts.next_page

    while !next_page.empty?
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
    # likes = []
    next_page = posts.next_page

    while !next_page.empty?
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

    while !next_page.empty?
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

    while !next_page.empty?
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
    next_page = friendsevents.next_page
    while !next_page.empty?
      friendsevents += next_page
      next_page = next_page.next_page
    end
    friendsevents.each do |events|
      friendcheckins << events["id"]
    end

    locations = current_user.facebook.get_connections("me", "checkins")
    places = []
    next_page = locations.next_page
    while !next_page.empty?
      locations += next_page
      next_page = next_page.next_page
    end
    locations.each do |location|
      places << location["place"]
    end

    traveled = places.count
    friendsevent = friendcheckins.count

    @locations = { places_traveled: traveled}
    render json: friendcheckins
  end

  def likes
    posts = current_user.facebook.get_connections("me", "posts")
    likes = []
    next_page = posts.next_page
    while !next_page.empty?
      posts += next_page
      next_page = next_page.next_page
    end

    posts.each do |post|
      if post['likes']
        likes += post['likes']['data']
      end
    end

    @likes = {likes: likes}
    render json: @likes
  end

end