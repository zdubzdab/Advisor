Rails.application.routes.draw do
  resources :comments, only: [:create]
  post '/rate' => 'rater#create', as: 'rate'
  resources :hotels, only: [:new, :create, :index, :show]
  devise_for :users
  root 'welcome#index'
end
