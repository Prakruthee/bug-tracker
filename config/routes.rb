Rails.application.routes.draw do
resources :users
root 'welcome#index'
end
