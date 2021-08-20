Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :user_stocks, only: [:create, :destroy]
  resources :portfolio, only: [:index]
  resources :friends, only: [:index, :destroy]
  resources :stocks, only: [:index]
end
