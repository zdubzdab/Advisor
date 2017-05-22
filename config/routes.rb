Rails.application.routes.draw do
  resources :hotels, only: [:new, :create, :index, :show]
  devise_for :users
  root 'welcome#index'
end
