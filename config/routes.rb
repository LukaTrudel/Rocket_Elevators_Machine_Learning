Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/quote'
  get 'pages/charts'
  get 'pages/admin_stats'
  get '/quote/new', to: 'quote#new'

  get 'pages/intervention'
  
  post '/quote', to: 'quote#create'
  post '/contact', to: 'contact#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
