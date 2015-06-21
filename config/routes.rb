Rails.application.routes.draw do
  resources :users

  namespace :calendars, only: [:create] do
    resources :vacations, only: [:index, :create]

    namespace :admin do
      scope :vacations do
        get 'dashboard' => 'vacations#dashboard', as: :vacations_dashboard
      end
    end
  end

  devise_for :users, only: [:session, :omniauth_callbacks], controllers: { omniauth_callbacks: "omniauth_callbacks" }, path: '/'
  devise_for :users, only: [:registration, :password], path: 'devise'

  root 'application#home'
end