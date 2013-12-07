class MainController < ApplicationController

  def worker
    HardWorker.perform_async(current_user.id);
    redirect_to root_path
  end

  def index
    unless current_user
      redirect_to login_path
    end
    HardWorker.perform_async(current_user.id);
  end

  def login

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
      render json: current_user.user_data.like_data
    end
  end


  def cultured
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.cultured
    else
      render json: current_user.user_data.cultured
    end
  end



  def tags_per_friend
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.tags_data
    else    
      render json: current_user.user_data.tags_data
    end
  end


  def likes
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.likes_data
    else
      render json: current_user.user_data.likes_data
    end
  end

  def user_likes
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.interests_data.gsub('=>',':').gsub(':music','"music"').gsub(':books','"books"').gsub(':movies','"movies"')
    else
      render json: current_user.user_data.interests_data.gsub('=>',':').gsub(':music','"music"').gsub(':books','"books"').gsub(':movies','"movies"')
    end
  end

  def hometowns
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.hometown_data.gsub(':top_places','"top_places"').gsub(':number','"number"').gsub('=>',':')
    else
      if current_user..user_data.hometown_data.gsub(':top_places','"top_places"').gsub(':number','"number"').gsub('=>',':')
        data = current_user.user_data.hometown_data.gsub(':top_places','"top_places"').gsub(':number','"number"').gsub('=>',':')
      else
        data = ""
      end
      render json: data
    end
  end

  def love
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.relationship_data.gsub("=>",":")
    else
      if current_user.user_data.relationship_data.gsub("=>",":")
        data = current_user.user_data.relationship_data.gsub("=>",":")
      else
        data = ""
      end
      render json: data
    end
  end

  def gender
    if params[:friend_id]
      render json: User.find_by_uid(params[:friend_id]).user_data.sex_data
    else
      render json: current_user.user_data.sex_data
    end
  end

end