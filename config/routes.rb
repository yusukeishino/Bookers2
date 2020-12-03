Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'

  resources :users, only: [:show, :edit, :index, :update]
  resources :books do
    resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end



  get 'home/about' => 'homes#about'
end