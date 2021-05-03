Rails.application.routes.draw do
  resources :articles
  root 'pages#home'
  # get request to the abouts page. To: controller#action
  get 'about', to: 'pages#about'
end
