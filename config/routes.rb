Rails.application.routes.draw do
  root to: "toppages#index"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  get 'inquiry/input' => 'inquiries#input'
  post 'inquiry/thanks' => 'inquiries#thanks'

  get 'find' => 'finds#index'

  get 'diagnose' => 'diagnoses#index'

  resources :users, only: [:new, :create, :edit, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :events

  resources :events, only: [:create, :delete] do
    post 'like' => 'favorites#create'
    delete 'like' => 'favorites#destroy'
  end
end
