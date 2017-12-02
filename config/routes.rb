Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'products#index'

  resources :products do
    resources :reviews, shallow: true
  end

  resources :reviews, only: [:index]


  #User routing
  get '/signup' => 'users#new'
  post '/users' =? 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
