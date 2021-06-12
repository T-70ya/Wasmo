Rails.application.routes.draw do
  devise_for :users
  get 'contents/index' => "contents#index", :as => :auth_at_start_date

  root to: 'contents#index'
  resources :contents
end
