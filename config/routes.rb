require "sidekiq/web"
Rails.application.routes.draw do

  #resources :search_suggestions
  resources :likes
  resources :notifications, only: [:index, :update]
  resources :posts
  resources :usuarios, as: :users, only: [:show, :update] do
    member do
      get :friends
    end
  end
  resources :friendships
  resources :comments

  devise_for :users, controllers: {
  	omniauth_callbacks: "users/omniauth_callbacks"
  }
  post "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up"
  get "/search", to: "search_people#search"
  #Ruta para manejar las sugerencias de busqueda.
  post "/search_people/search_suggestions", to: "search_people#search_suggestions"


  authenticated :user do
  	root 'main#home'
  end

  unauthenticated :user do
  	root 'main#unregistered'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'
end
