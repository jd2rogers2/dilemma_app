Rails.application.routes.draw do
  devise_for :users
  resources :dilemmas
  resources :tags
  resources :options
  root to: 'welcome#home'
end
