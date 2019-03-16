Rails.application.routes.draw do
  root to: "toppages#index"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  get 'inquiry/input' => 'inquiries#input'
  post 'inquiry/thanks' => 'inquiries#thanks'

  resources :users, only: [:new, :create, :edit, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :events
end
