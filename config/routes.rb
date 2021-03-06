Kniguru::Application.routes.draw do


  get "subscriptions/edit"
  get "subscriptions/update"
  resources :news

  get "auth/oauth"    => "authentications#new", :as => "auth"
  get "auth/:provider/callback" => "authentications#create"
  get "auth/:id/destroy" => "authentications#destroy", :as => "destroy_auth"
  
  get  "login"  =>  "sessions#new",     :as => :login
  post "login"  =>  "sessions#create"
  get  "logout" =>  "sessions#destroy", :as => :logout
  
  resources :users do
      collection do 
         get :password_ask_email
         post :send_password_reset
         post :reset_password
         get "reset_password" => "users#password_reset_form"
         post "/new/step2" => "users#step2", :as => :step2
      end
      member do
        get :activate
        get :wall
        get :get_options
        patch :set_options
      end      
  end
  
  resources :books do
      collection do
        get :rating
        get :search
        get :short_list
      end
      member do
          post :rate
      end
  end

  resources :pages

  resources :presses, :path => "press"
  resources :writings
  resources :experts
  
  resources :seasons
  
  resources :comments, :only => [:create, :edit, :update, :destroy]
  
  resources :badges, :except => [:new]

  resources :reviews

  resources :book_tracks, only: [:index, :create, :destroy] do
    member do
      patch :read
      patch :unread
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#show', :main => true

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
