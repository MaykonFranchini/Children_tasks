Rails.application.routes.draw do
  devise_for :children, path: 'child'
  devise_for :users, path: 'parents'

  root to: 'pages#home'

  get '/user' => "users#dashboard", :as => :user_root
  get '/child' => "children#dashboard", :as => :child_root

   get "children/:id", to: 'children#show', as: :child

  get 'selectlogin', to: 'pages#selectlogin'

  resources :transactions, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
