Rails.application.routes.draw do
  devise_for :admins
  resources :users
  resources :survey
end
