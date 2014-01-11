Getgft::Application.routes.draw do
  resources :gifts

  resources :lists

  devise_for :users
  resources :public


  root 'pages#welcome'
end
