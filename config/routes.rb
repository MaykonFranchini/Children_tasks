Rails.application.routes.draw do
  devise_for :children, path: 'child'
  devise_for :users, path: 'parents'

  root to: 'pages#home'

  get '/user' => "users#dashboard", :as => :user_root
  get '/user/profile' => "users#profile", :as => :user_profile
  get '/child' => "children#dashboard", :as => :child_root

   get "children/:id", to: 'children#show', as: :child

  get 'selectlogin', to: 'pages#selectlogin'

  resources :transactions, only: [:new, :create, :destroy]
  resources :tasks
  resources :messages, only: [:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticate :user do
  mount Sidekiq::Web => '/sidekiq'
end
end
