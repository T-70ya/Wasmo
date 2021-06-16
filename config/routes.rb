Rails.application.routes.draw do
  devise_for :users
  get 'contents/index'
  #get 'search' => 'contents#search'

  root to: 'contents#index'
  resources :contents
  resources :plans
end
