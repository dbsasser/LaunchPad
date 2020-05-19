Rails.application.routes.draw do
  
  #Need to namespace
  get '/campaigns/newest', to: 'campaigns#newest'
  get '/campaigns/most_raised', to: 'campaigns#most_raised'
  get '/campaigns/funded', to: 'campaigns#funded'

  
  resources :campaigns do
    resources :comments, only: [:new, :create]
    resources :donations, only: [:new, :create, :index ]
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'  }
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "campaigns#index"

end
