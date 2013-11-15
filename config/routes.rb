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
  match 'vulgar', to: 'main#vulgar'
  match 'funny', to: 'main#funny'
  match 'likes', to: 'main#likes'
  match 'party', to: 'main#party'
  match 'photos', to: 'main#photos'
  match 'locations', to: 'main#locations'

  root to: "main#index"
end