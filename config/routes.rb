Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#index'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/quote'
  get 'pages/charts'
  get 'pages/admin_stats'
  get 'pages/machine_learning'
  get '/quote/new', to: 'quote#new'

  get 'pages/intervention'
  get 'update_buildings', to: 'interventions#update_buildings'
  get 'update_battery', to: 'interventions#update_battery'
  get 'update_column', to: 'interventions#update_column'
  get 'update_elevator', to: 'interventions#update_elevator'

  resources :interventions 
  
  post '/quote', to: 'quote#create'
  post '/contact', to: 'contact#create'

  post '/interventions', to: 'interventions#create'
  post '/identification', to: 'identification#create'
  # post '/leads', to: 'leads#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
