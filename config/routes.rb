Rails.application.routes.draw do
  resources :users

  namespace :calendars, only: [:create] do
    resources :vacations, only: [:index, :create]

    namespace :admin do
      resources :vacations, only: [:index]
      resources :teams,     only: [:index]
    end
  end

  devise_for :users, only: [:session, :omniauth_callbacks], controllers: { omniauth_callbacks: "omniauth_callbacks" }, path: '/'
  devise_for :users, only: [:registration, :password], path: 'devise'

  root 'application#home'
end