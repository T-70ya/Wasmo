Rails.application.routes.draw do
  get 'contents/index'

  root to: 'contents#index'
  resources :contents, only: [:index, :create, :show, :edit, :destroy, :update]
end
