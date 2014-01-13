Getgft::Application.routes.draw do

  get 'shared/:shared_key', to: 'lists#shared', as: :shared
  put 'shared/:shared_key/gifts/:id', to: 'gifts#update', as: :shared_update

  resources :lists do
    resources :gifts
  end



  devise_for :users, :path => ''

  authenticated :user do
    root 'lists#index', as: :authenticated_root
  end

  root 'pages#welcome'
end
