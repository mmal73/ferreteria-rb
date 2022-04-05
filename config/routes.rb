Rails.application.routes.draw do
  get 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  get 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"
  post 'order_items' => "order_items#create"
  delete 'order_items/:id/delete' => "order_items#destroy", as: "order_item_destroy"
  get 'order_items/:id' => "order_items#show", as: "order_item"
  
  get 'cart' => "carts#show", as: "cart"
  delete 'cart_empty' => "carts#destroy"
  
  resources :orders, only: [:index, :show, :new]
  resources :products
  
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    get 'register', to: 'devise/registrations#new', as: :register
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'home#index'
end
