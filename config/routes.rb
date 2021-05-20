Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cities do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get :accept
      get :decline
    end
  end

end
