require 'resque/server'
Rails.application.routes.draw do
  mount Resque::Server, :at => "/resque"

  get 'requests',          to: 'requests#index',      as: :requests
  get 'requests/new',      to: 'requests#new',        as: :new_request
  post 'requests',         to: 'requests#create'
  get 'request/:id',       to: 'requests#show',       as: :request
  patch 'request/:id',     to: 'requests#update'
  delete 'request/:id',    to: 'requests#destroy'
  get 'request/:id/edit',  to: 'requests#edit',       as: :edit_request

  get 'users',          to: 'users#index',      as: :users
  get 'users/new',      to: 'users#new',        as: :new_user
  post 'users',         to: 'users#create'
  get 'user/:id',       to: 'users#show',       as: :user
  patch 'user/:id',     to: 'users#update'
  delete 'user/:id',    to: 'users#destroy'
  get 'user/:id/edit',  to: 'users#edit',       as: :edit_user

  get "/login",  to: "sessions#create",    as: :login
  post "/login", to: "sessions#create"
  delete "/logout",      to: "sessions#destroy",            as: :logout

  root "home#show"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#request'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
