Rails.application.routes.draw do
  get 'order/index'
  get 'order/show'
  get 'order/create'
  get 'cart_items/create'
  get 'cart_items/destroy'
  resources :carts, only: [:show, :update] do
    resources :cart_items, only: [:create, :destroy]
  end
  resources :orders
  get 'photos/create'
  get 'user/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  root "items#index"
  resources :items
  resources :user, path: 'profile'
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'new_checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
