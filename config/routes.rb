Rails.application.routes.draw do
  root 'homes#show', via: :get
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resource :dashboard, only: [:show]
  resources :shouts, only: [:create, :show]

end
