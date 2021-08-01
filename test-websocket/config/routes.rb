Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chat_rooms, only: [:index, :create, :show]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'
end
