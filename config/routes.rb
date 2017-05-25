Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :hotels, only: [:new, :create, :index, :show]
  devise_for :users, skip: [:passwords]
  resources :ratings, only: :create
  root 'welcome#index'
end
