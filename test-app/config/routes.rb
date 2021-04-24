Rails.application.routes.draw do
  root 'pages#home'
  # get request to the abouts page. To: controller#action
  get 'about', to: 'pages#about'
end
