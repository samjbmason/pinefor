Getgft::Application.routes.draw do
  resources :gifts

  resources :lists

  devise_for :users

  root 'pages#welcome'
end
