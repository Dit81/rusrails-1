Rusrails::Application.routes.draw do

  # get "omniauth_callbacks/facebook"
# 
  # get "omniauth_callbacks/vkontakte"

  # devise_for :users

  # resources :users

  # Omniauth pure
  match "/signin" => "services#signin"
  match "/signout" => "services#signout"

  # match 'auth/:service' => 'services#create' 
  # match '/users/auth/:service/callback' => 'services#create' 
  # match '/auth/failure' => 'services#failure'

  
  resources :orders
  resources :clients
  match '/people/activated' => 'people#index', :foo => "bar", :status => "activated"
  resources :people
  resources :books
  resources :nomenclatures
  resources :posts do
    resources :comments
  end

   get "home/index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :users, :controllers => { :omniauth_callbacks => "services#create" }
  # devise_for '', :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :services, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'signup'
      post 'newaccount'
      get 'failure'
    end
  end
  resources :users, :only => [:index, :destroy]
  root :to => 'users#index'  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
