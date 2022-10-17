Rails.application.routes.draw do
  get 'calendars/index'
  devise_for :users
  get 'events/index'
  root to: 'events#index'
  resources :events
  resources :calendars
end