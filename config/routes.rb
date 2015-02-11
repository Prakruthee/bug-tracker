Rails.application.routes.draw do
  get "users/check_email"=>"users#check_email"
  root 'welcome#index'
  resources :users
  get "sessions/check_email"=>"sessions#check_email"
  resources :sessions, except: :show
end
