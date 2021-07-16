Rails.application.routes.draw do
  get 'reservers/index'
  resources :greenhouses do
    collection do
      get 'search'
    end
  end
  root 'homes#top'
  resource :user, only: [:new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :users, only: [:edit, :update]
  patch 'user', to: "users#update"
  resources :reservers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end