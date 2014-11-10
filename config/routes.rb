Rails.application.routes.draw do

  get 'tags/:tag', to: 'pins#index', as: :tag

  resources :pins
  resources :posts

  devise_for :installs
  devise_for :users

  get "users/show"
  
  # devise_for :installs
  root "posts#index"
  get "about" => "pages#about" # creates about_path

    get "mission" => "pages#mission" 
    get "services" => "pages#services"
    get "goldsmith" => "pages#goldsmith"
    get "awards" => "pages#awards"

  get "gallery" => "pages#pins"
  get "products" => "pages#products" # creates products_path

    get "rings" => "pins#rings"
    get "fashion" => "pins#fashion"
    get "pearls" => "pins#pearls"
    get "gold" => "pins#gold"
    get "childs" => "pins#childs" 
    get "custom" => "pins#custom"

    get "contact" => "pages#contact"
    
  # match '/contacts',     to: 'contacts#new',             via: 'get'
  # resources "contacts", only: [:new, :create]

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
  #   namespace :user do
  #     # Directs /user/products/* to user::ProductsController
  #     # (app/controllers/user/products_controller.rb)
  #     resources :products
  #   end
end
