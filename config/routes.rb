Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :users
  resources :photos
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :users do
    get :search, on: :collection
  end
  resources :users do
    resources :favorites
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
    resources :likes
  end
end
