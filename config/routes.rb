Rails.application.routes.draw do
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

  root to: "galleries#index"
  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :show]

    # get "/images/new" => "images#new"
    # post "/images" => "images#create"

  end

  resources :images, only: [:show, :edit, :update] do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  
  resources :groups, only: [:index, :new, :create, :show] do
    resource :group_membership, only: [:create, :destroy]
  end
  resources :group_images, only: [:create]
  get "/sign_up", to: "users#new"
  get "/sign_in", to: "sessions#new"

  # get "/galleries" => "galleries#index"
  # get "/galleries/new" => "galleries#new"
  # get "/galleries/:id/edit" => "galleries#edit"
  # get "/galleries/:id" => "galleries#show"
  # post "/galleries" => "galleries#create"
  # patch "/galleries/:id" => "galleries#update"
  # delete "/galleries/:id" => "galleries#destroy"
end
