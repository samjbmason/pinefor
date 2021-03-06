Pinefor::Application.routes.draw do

  get 'public/:public_hash', to: 'lists#public', as: :public_list

  put 'public/:public_hash/gifts/:id', to: 'gifts#public_update', as: :public_gift_update

  authenticated :user do
    root 'lists#index', as: :authenticated_root
    get '/lists', to: redirect('/')
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :users, only: [:destroy]
  end

  resources :lists do
    resources :gifts
  end

  devise_for :users, :path => '', :path_names => {sign_in: 'signin', sign_out: 'signout', sign_up: 'signup'}

  get 'about', to: 'pages#about'

  root 'pages#welcome'

  match ':status', to: 'errors#show', constraints: {status: /\d{3}/ }, via: :all
end
