Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :users
  resources :photos
  resources :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
end
