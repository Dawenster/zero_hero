Rails.application.routes.draw do
  # devise_for :users
  root 'pages#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end
