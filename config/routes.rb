Rails.application.routes.draw do
  # delete 'factors/destroy'
  resources :factors, only: [:destroy, :new, :create]

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :dilemmas
  resources :tags
  resources :options
  root to: 'welcome#home'
end
