Rails.application.routes.draw do
  get "users/check_email"=>"users#check_email"
  root 'welcome#index'
  resources :users
end
