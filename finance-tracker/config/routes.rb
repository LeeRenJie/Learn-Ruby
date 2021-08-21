Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :user_stocks, only: [:create, :destroy]
  resources :portfolio, only: [:index]
  resources :users, only: [:index, :destroy]
  resources :stocks, only: [:index]
  resources :friendships, only: [:create, :destroy]
  get 'friends', to: 'users#friends'
  get 'search_friend', to: 'users#search'
end
