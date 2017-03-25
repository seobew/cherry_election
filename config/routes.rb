Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # get 'home/index' => 'home#index'
  root 'home#index'
  get 'home/like/:article' => 'home#like'
  get 'home/unlike/:article' => 'home#unlike'
  get 'home/candidate/:candidate_id' => 'home#candidate'
  post '/article/like', to: 'home#like', as: 'article_like'
  post '/article/unlike', to: 'home#unlike', as: 'article_unlike'
  post '/article/like_cancel', to: 'home#like_cancel', as: 'article_like_cancel'
  post '/article/unlike_cancel', to: 'home#unlike_cancel', as: 'article_unlike_cancel'

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
