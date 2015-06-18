Rails.application.routes.draw do
  resources :users

  devise_for :users, only: [:session, :omniauth_callbacks], controllers: { omniauth_callbacks: "omniauth_callbacks" }, path: '/'
  devise_for :users, only: [:registration, :password], path: 'devise'

  root 'application#home'
end