Rails.application.routes.draw do
   match '/'    => "home#index", as: :home, via: [:get, :post]

   #get 'user/create'
   #match 'users/new' 
   resources :users, only: [:new,:create]
   resources :sessions, only: [:new, :create, :delete]
   match '/signin', to: 'sessions#new',  via: :get
   match '/signup', to: 'users#new',  via: :get
   match '/signout', to:'sessions#destroy',  via: [:delete]
   match '/profile', to: 'users#profile', via: :get
   match '/sessions', to: 'sessions#new', via: :get
   match '/users/edit', to: 'users#edit', as: :edit_user, via: :get
   match '/admin_login', to: 'sessions#admin_new', via: :get
   match '/admin_create', to: 'sessions#admin_create', via: :post
   match '/admin_signout', to: 'sessions#admin_destroy', via: :delete
   match '/admin_home', to: 'admin#home', via: :get
   match '/users/update', to: 'users#update', via: [:post , :patch]
   resources :companies
   root 'companies#index'
   match 'studentlists/new', to: 'studentlists#create', via: :post
   match 'reminder', to: 'admin#reminder', via: :post
   match 'send_reminder', to: 'admin#send_reminder', via: :get
   match 'companies/agenda/:company', to: 'companies#company_agenda', via: :get
#must change root
  # root  'home#index'
   #root to: "users#new"
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
