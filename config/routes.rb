Bookmarkme::Application.routes.draw do
  get "emails_controller/post"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :topics do 
    resources :bookmarks, only: [:destroy] 
  end

  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end

  #post :incoming, to: 'incoming#create'
  post :incoming, to: 'incoming#create'
  get :incoming, to: 'incoming#create'
  
  root :to => 'sites#index', :constraints => RoleConstraint.new(:current_user) #matches this route when the current user is an user
  root :to => 'welcome#index'

  # def create_route
  #   data = Multimap.new
  #   data[:priority] = 0
  #   data[:description] = "Sample route"
  #   data[:expression] = "catch_all()"
  #   data[:action] = "forward('http://bookmarkme.co/incoming/')"
  #   RestClient.post "https://api:key-001f3e35b63856b602eb46751e3382d4"\
  #   "@api.mailgun.net/v2/routes", data
  # end
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
