Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :events

  root 'events#index'
end
