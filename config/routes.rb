Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
     get 'addtocart/:id' => 'products#addtocart'
     get 'dropatcart/:id' => 'products#dropatcart'

      get 'showcart/' => 'products#showcart'

       get 'sh' => 'products#sh'

       get 'allorders' => 'orders#allorders'

       get 'showorder/:id' => 'orders#showorder'

       get 'alusers' => 'users#alusers'
       
        get '/edit/:id' => 'products#edit'

          get '/delete/:id' => 'products#delete'

  # Example of named route that can be invoked with purchase_url(id: product.id)
resources :users

resources :products

resources :orders


resources :sessions, only: [:new, :create, :destroy]
     root 'welcome#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'


     

  # Example resource route (maps HTTP verbs to controller actions automatically):

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
