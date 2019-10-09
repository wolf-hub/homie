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

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :properties
      devise_for :users, 
                  :controllers => {registrations: "api/v1/registrations", sessions: "api/v1/sessions"},
                  path_names: { sign_in: :login }
    end
  end

  devise_for :users,
             :controllers => {registrations: 'registrations'},
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'}
             
  resources :landlords do
    member do
      delete :delete_image_attachment
    end  
  end  
  resources :tenants do
    member do
      delete :delete_image_attachment
    end  
  end  
  resources :properties
  resources :requests do
    member do
      get 'responses'
      get 'response_property'
      patch :activate
      put :activate
      get 'congratulations'
    end  
  end  
  resources :properties do
    member do
      get 'all_requests'
      get 'show_request'
      delete :delete_image_attachment
      patch :activate
      put :activate
      get 'congratulations'
    end  
  end

  resources :purchases
  resources :points

  resources :properties do
    resources :requests do        
      resources :purchases        
    end  
  end

  resources :properties do
    resources :requests do 
      resources :points         
    end  
  end

  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"

 

  get '/notifications' => 'notifications#index'

  get '/payment_method' => "landlords#payment"
  post '/add_card' => "landlords#add_card"

  resources :conversations, only: [:index, :create]  do
    resources :messages, only: [:index, :create]
  end

  require 'sidekiq/web'
authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'
end

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
