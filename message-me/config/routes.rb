Rails.application.routes.draw do
  root 'chatrooms#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'
end
