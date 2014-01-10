Maison::Application.routes.draw do

  resources :lists

  devise_for :users

  root 'pages#welcome'
end
