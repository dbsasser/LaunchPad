Rails.application.routes.draw do
  resources :comments
  resources :donations
  resources :campaigns do
    resources :comments
    resources :donations
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations'  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "campaigns#index"

end
