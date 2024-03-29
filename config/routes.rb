Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "/search", :to => 'pages#search', :as => :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'

  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
    resources :search, only: :create
    resources :reviews, only: :create
  end
  resources :users, only: :show
  post "favorite", to: "favorites#favorite"
  post "unfavorite", to: "favorites#unfavorite"
end
