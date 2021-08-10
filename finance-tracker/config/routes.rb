Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :portfolio, only: [:index]
  resources :stocks, only: [:index]
end
