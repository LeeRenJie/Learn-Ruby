Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :messages, only: %i(index create)
end
