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
    end  
  end  
  resources :properties do
    member do
      get 'all_requests'
      get 'show_request'
      delete :delete_image_attachment
    end  
  end

  resources :purchases

  resources :properties do
    resources :requests do        
      resources :purchases         
    end  
  end

  get '/step1' => 'requests#step1'  
  get '/step2' => 'requests#step2'
  post '/step2' => 'requests#step2'  
  get '/step3' => 'requests#step3'
  post '/step3' => 'requests#step3'  
  get '/step4' => 'requests#step4'
  post '/step4' => 'requests#step4'   
  get '/step5' => 'requests#step5' 
  post '/step5' => 'requests#step5'  
  get '/step6' => 'requests#step6' 
  post '/step6' => 'requests#step6'
  post '/steplast' => 'requests#steplast'  

  get '/notifications' => 'notifications#index'

  get '/payment_method' => "landlords#payment"
  post '/add_card' => "landlords#add_card"

  resources :conversations, only: [:index, :create]  do
    resources :messages, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
