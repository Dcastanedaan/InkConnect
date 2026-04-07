Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      post :create_by_admin
    end
  end
  
  get "dashboard", to: "dashboard#index"
  resources :tattoo_artists do
    resources :portfolios, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :update, :destroy]
    end
  end
  resources :portfolios, only: [:index]

  root "users#index"

  resources :users, only: [:index, :show, :create]

end
