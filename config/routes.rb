SummitDoodles::Application.routes.draw do
  
  resources :email_priorities
  resources :weight_reports
  
  #report routs
  match '/reports/expense', :to => 'reports#expense'

  #get "email_list/index"
  match '/email_list/index', :to => 'email_list#index'

  resources :charge_types

  #this is a comment
  resources :expenses

  resources :expense_types

  resources :expense_tax_types

  resources :clients do
    resources :support_clients
    resources :payments
    resources :charges
  end

  resources :litters
  
  resources :heat_cycles
  
  resources :dames
  
  resources :sires
  
  resources :weights do
    get 'siteHTM', :on => :collection
  end
  
  resources :puppies

  resources :colors
  
  resources :relations
  
  resources :states  
  
  resources :breeds
  
  resources :genders  
  
  resources :users

  #Available Puppies
  get "available_puppies/index"
  get "available_puppies/assign_puppy"
  get "available_puppies/show"
  get "available_puppies/edit"
  post "available_puppies/update"
  
  get "sessions/new"
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "menu#index"
  match '/menu', :to => 'menu#index'
  match '/destroy_session', :to => 'menu#destroy_session'
  
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



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
