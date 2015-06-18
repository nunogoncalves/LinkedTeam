Rails.application.routes.draw do

  resources :users
  devise_for :users
  root 'application#home'


  # resources :users

end
