Getgft::Application.routes.draw do

  resources :lists do
    resources :gifts
  end

  resources :public

  devise_for :users, :path => ''

  authenticated :user do
    root 'lists#index', as: :authenticated_root
  end

  root 'pages#welcome'
end
