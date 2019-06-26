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
  resources :requests do
    member do
      get 'responses'
      get 'response_property'
      patch :activate
      put :activate
    end  
  end  
  resources :properties do
    member do
      get 'all_requests'
      get 'show_request'
      delete :delete_image_attachment
      patch :activate
      put :activate
    end  
  end

  resources :purchases

  resources :properties do
    resources :requests do        
      resources :purchases         
    end  
  end

 

  get '/notifications' => 'notifications#index'

  get '/payment_method' => "landlords#payment"
  post '/add_card' => "landlords#add_card"

  resources :conversations, only: [:index, :create]  do
    resources :messages, only: [:index, :create]
  end

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
