Rails.application.routes.draw do
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
