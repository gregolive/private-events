Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :events
  resources :signups, :only => [:create, :destroy, :index]

  root 'events#index'
end
