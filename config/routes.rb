Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/about' => 'welcome#about'
  get '/contact' => 'welcome#contact'
  post '/contact' => 'welcome#contact'

  resources :greeting_cards
  post 'discontinue/greeting_cards/:id' => 'led_picture#discontinue', as: :discontinue_greeting_card
  post 'recontinue/greeting_cards/:id' => 'led_picture#recontinue', as: :recontinue_greeting_card
  get '/cards/birthday' => 'greeting_cards#birthday'
  get '/cards/sympathy'  => 'greeting_cards#sympathy'
  get '/cards/thank_you' => 'greeting_cards#thank_you'
  get '/cards/love' => 'greeting_cards#love'
  get '/cards/congratulations' => 'greeting_cards#congratulations'
  get '/cards/anniversary' => 'greeting_cards#anniversary'
  resources :led_pictures
  post 'discontinue/led_picture/:id' => 'led_pictures#discontinue', as: :discontinue_led_picture
  post 'recontinue/led_picture/:id' => 'led_pictures#recontinue', as: :recontinue_led_picture
  resources :guitar_string_bracelets

  post '/sessions' => 'sessions#create'

	resources :users
	get '/admin' => 'admin#index'

  get '/admin/logged_in' => 'admin#logged_in'
  get '/admin/logged_in/led_pictures' => 'admin#led_pictures'
  get '/admin/logged_in/greeting_cards' => 'admin#greeting_cards'

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
