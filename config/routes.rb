Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :dilemmas
  resources :tags
  resources :options
  root to: 'welcome#home'
end
