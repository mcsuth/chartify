FbAuth::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'sessions#create'
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'login', to: 'main#login'
  match 'user_data', to: 'main#user_data'
  match 'json', to: 'main#json'
  match 'friends_on_chartify', to: 'main#friends_on_chartify'
  match 'friends_off_chartify', to: 'main#friends_off_chartify'
  match 'likes_per_friend', to: 'main#likes_per_friend'
  match 'tags_per_friend', to: 'main#tags_per_friend'
  match 'user_likes', to: 'main#user_likes'
  match 'hometowns', to: 'main#hometowns'
  match 'love', to: 'main#love'
  match 'gender', to: 'main#gender'
  match 'likes', to: 'main#likes'
  match 'cultured', to: "main#cultured"
  match 'worker', to: "main#worker"

  root to: "main#index"
end