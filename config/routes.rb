ThoughtLogApp::Application.routes.draw do
  get '/signup' => "users#new"
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'
  get '/' => 'users#new'

  get '/users/:id/dashboard' => 'users#dashboard'

  resources :users do
    resources :entries
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
#== Route Map
# Generated on 22 Oct 2013 07:34
#
#           login GET    /login(.:format)                           session#new
#                 POST   /login(.:format)                           session#create
#          logout POST   /logout(.:format)                          session#destroy
#                 GET    /users/:id/dashboard(.:format)             users#dashboard
#    user_entries GET    /users/:user_id/entries(.:format)          entries#index
#                 POST   /users/:user_id/entries(.:format)          entries#create
#  new_user_entry GET    /users/:user_id/entries/new(.:format)      entries#new
# edit_user_entry GET    /users/:user_id/entries/:id/edit(.:format) entries#edit
#      user_entry GET    /users/:user_id/entries/:id(.:format)      entries#show
#                 PUT    /users/:user_id/entries/:id(.:format)      entries#update
#                 DELETE /users/:user_id/entries/:id(.:format)      entries#destroy
#           users GET    /users(.:format)                           users#index
#                 POST   /users(.:format)                           users#create
#        new_user GET    /users/new(.:format)                       users#new
#       edit_user GET    /users/:id/edit(.:format)                  users#edit
#            user GET    /users/:id(.:format)                       users#show
#                 PUT    /users/:id(.:format)                       users#update
#                 DELETE /users/:id(.:format)                       users#destroy
