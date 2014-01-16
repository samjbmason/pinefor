Pinefor::Application.routes.draw do

  get 'public/:public_hash', to: 'lists#public', as: :public_list
  put 'public/:public_hash/gifts/:id', to: 'gifts#update', as: :public_gift_update

  resources :lists do
    resources :gifts
  end

  devise_for :users, :path => ''

  authenticated :user do
    root 'lists#index', as: :authenticated_root
  end

  root 'pages#welcome'
end
