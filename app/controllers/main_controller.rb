class MainController < ApplicationController

  def index
    unless current_user
      redirect_to login_path
    end
  end

  def login

  end

  def post_messages
  	posts = current_user.facebook.get_connections("me", "posts")
  	messages = ""
  	likes = []
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

end