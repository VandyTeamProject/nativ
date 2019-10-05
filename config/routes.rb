Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
<<<<<<< HEAD
  match '/jQuery/dist/jquery.js', :to => 'pages#search', :as => :search, via: [:get, :post]
=======
  get '/search' => 'pages#search', :as => 'search_page'
>>>>>>> 3f87b79755f62ffd65c32dc3a23c204f02b7f97c
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'

  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
    resources :search, only: :create
    resources :reviews, only: :create
  end
  resources :users, only: :show
end
