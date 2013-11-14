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

  def vulgar
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
    end

    funnys = messages.upcase.split(" ").count("FUNNY")
    lols = messages.upcase.split(" ").count("LOL")
    hahas = messages.upcase.split(" ").count("HAHA")
    lmao = messages.upcase.split(" ").count("LMAO")

    @messages = {funnys: funnys, lols: lols, hahas: hahas, lmao: lmao}
    render json: @messages
  end

  def party
    @party = current_user.facebook.get_connections("me", "events?since=1349654400")

    # party.each do |yay|
    #   party = { events: yay['name'], }
    # end

    render json: @party
  end

  def likes
    posts = current_user.facebook.get_connections("me", "posts")
    messages = ""
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