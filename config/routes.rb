Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#index'
  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
  end
  resources :users, only: :show

end
