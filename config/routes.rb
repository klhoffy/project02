Rails.application.routes.draw do
  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'users' => 'users#index'

  get 'users/new' => 'users#new', as: :new_user

  post 'users' => 'users#create'

  get 'users/:id' => 'users#show', as: :user

  get 'users/:id/edit' => 'users#edit', as: :edit_user

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  root 'products#index'

  get 'products/new' => 'products#new', as: :new_product

  post 'products/' => 'products#create'

  get 'products/:id' => 'products#show', as: :product

  get '/cart' => 'cart#index'

  get '/cart/clear' => 'cart#clearCart'

  get '/cart/:id' => 'cart#add'

  # get 'users/:user_id/cart' => 'cart#index', as: :cart

  # post 'users/:user_id/cart' => 'cart#create', as: :user_cart

  # get 'users/:user_id/cart/new' => 'cart#new', as: :new_cart

  # get 'users/:user_id/cart/:id/edit' => 'cart#edit', as: :edit_cart

  # get 'users/:user_id/cart/:id' => 'cart#show', as: :cart

  # patch 'users/:user_id/cart/:id' => 'cart#update'

  # delete 'users/:user_id/cart/:id' => 'cart#destroy'

  get 'products/:id/edit' => 'products#edit', as: :edit_product
  
  patch 'products/:id' => 'products#update'

  delete 'products/:id' => 'products#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
