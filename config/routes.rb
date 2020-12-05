Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'

  resources :users, only: [:show, :edit, :index, :update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :users, only: :show

  get 'home/about' => 'homes#about'

  get 'follow_users' => 'users#follow_users'
  get 'follower_users' => 'users#follower_users'


end