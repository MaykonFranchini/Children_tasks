Rails.application.routes.draw do
  devise_for :children, path: 'child'
  devise_for :users, path: 'parents'

  root to: 'pages#home'

  get 'users/dashboard', to: 'users#dashboard', as: :dashboard

  resources :families, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
