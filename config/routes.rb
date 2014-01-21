Pinefor::Application.routes.draw do

  authenticated :user do
    root 'lists#index', as: :authenticated_root
    get '/lists', to: redirect('/')
  end

  root 'pages#welcome'

  devise_for :users, :path => ''

  resources :lists do
    resources :gifts
  end

  get 'public/:public_hash', to: 'lists#public', as: :public_list
  put 'public/:public_hash/gifts/:id', to: 'gifts#public_update', as: :public_gift_update

end
