Rails.application.routes.draw do
  
  root to:'home#index'
  

  resources :users 
  get 'signup' => 'users#create'
  get 'list' => 'users#index'
  get 'users/:id/posts' => 'users#posts', :as => :user_posts
  

  resources :posts do
    resources :comments
  end
  post 'postcomment' => 'comments#create'
  get 'newpost' => 'posts#new'
  get 'all' => 'posts#index'
  post 'all' => 'posts#index'
 

  resources :collections
  post 'newcollection' => 'collections#new'
  post 'destroycollection' => 'collections#destroy'
  get 'showcollection' => 'collections#show'

  resources :movies
  post 'newmovie' => 'movies#new'
  post 'destroymovie' => 'movies#destroy'
  #resources :posts

  #get 'newpost' => 'posts#create'
  #get 'all' => 'posts#index'

  resources :sessions
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'home/index'
 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 

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
