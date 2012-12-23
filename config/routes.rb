Fora::Application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }

  #added by mckain | Nov 3, 2012 - 4:58 PM
  resources :dashboard
  root :to => 'home#index'
  #added by edwin | Nov 9, 2012 - 11:00 PM
  resources :boards
  #added by edwin | Nov 11, 2012 - 11:10 AM
  resources :posts
  #added by edwin | Nov 17, 2012 - 3:23 PM
  resources :after_register
  #added by edwin | Nov 17, 2012 - 6:34 PM
  resources :follows
  #added by edwin | Dec 12, 2012 - 11:12 PM
  resources :comments
  #added by edwin | Dec 16, 2012 - 12:34 AM
  resources :posts do
    member do
      post :vote_up
    end
  end
  #added by edwin | Dec 22, 2012 - 3:52 PM
  #get 'tags/:tag', to: 'article#index', as: :tag
  #get 'follows/:follow', to: 'follow#follow_up', as: :follow
  resources :boards do
    member do
      post :follow_up
    end
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
  #root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
