FbAuth::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'sessions#create'
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'login', to: 'main#login'
  match 'user_data', to: 'main#user_data'
  match 'json', to: 'main#json'
  match 'vulgar', to: 'main#vulgar'
  match 'funny', to: 'main#funny'
  match 'likes', to: 'main#likes'
  match 'party', to: 'main#party'

  root to: "main#index"
end