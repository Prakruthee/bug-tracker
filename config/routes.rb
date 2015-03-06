Rails.application.routes.draw do

  root 'welcome#index'
  get "users/check_username"=>"users#check_username"
  get "users/check_email"=>"users#check_email"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  get "sessions/check_username"=>"sessions#check_username"
  resources :users
  resources :sessions, except: :show
  resources :issues
  resources :comments

end
