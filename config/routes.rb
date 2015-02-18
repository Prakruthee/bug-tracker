Rails.application.routes.draw do
  get "users/check_username"=>"users#check_username"
  get "users/check_email"=>"users#check_email"
  root 'welcome#index'
  get "sessions/check_email"=>"sessions#check_email"
  resources :users
  resources :sessions, except: :show
end
