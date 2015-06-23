Rails.application.routes.draw do
  resources :users

  namespace :calendars do
    resources :vacations, only: [:index, :create]

    namespace :admin do
      resources :vacations, only: [:index]
      resources :teams
    end
  end

  devise_for :users, only: [:session, :omniauth_callbacks], controllers: { omniauth_callbacks: "users" }, path: '/'
  devise_for :users, only: [:registration, :password], path: 'devise'

  root 'application#home'
end