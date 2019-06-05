Rails.application.routes.draw do
  get 'requests/index'
  get 'requests/show'
  get 'requests/update'
  get 'requests/destroy'
  get 'requests/edit'
  get 'requests/create'
  get 'requests/new'
  root 'pages#home'
  get 'pages/home'
  get 'pages/home_landlord'
  get 'properties/index'
  get 'properties/new'
  get 'properties/create'
  get 'properties/update'
  get 'properties/show'
  get 'properties/edit'
  get 'properties/destroy'
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'}
             
  resources :landlords
  resources :tenants
  resources :properties
  resources :requests
  resources :properties do
    get 'all_requests'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
