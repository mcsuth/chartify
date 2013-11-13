FbAuth::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'sessions#create'
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'login', to: 'main#login'
  match 'post_messages', to: 'main#post_messages'

  root to: "main#index"
end