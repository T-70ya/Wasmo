Rails.application.routes.draw do
  get 'contents/index' => "contents#index", :as => :auth_at_start_date

  root to: 'contents#index'
  resources :contents
end
