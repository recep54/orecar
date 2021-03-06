Rails.application.routes.draw do
  resources :japans
  devise_for :users
  resources :cars
  root to: 'cars#home'

  get '/load', to: 'japans#load'
  get '/load/bmw', to: 'japans#bmw'
  get '/load_image', to: 'japans#image_load'
  get '/selection/:id', to: "japans#selection", as: 'selection'

  post '/selection/:id', to: 'japans#validat'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
