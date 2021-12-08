Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :events
  resources :signups, :only => [:create, :destroy]

  root 'events#index'
end
