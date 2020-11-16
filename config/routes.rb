Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  resources :books
  resources :users, only: [:show, :edit, :index, :update]
  get 'home/about' => 'homes#about'
end