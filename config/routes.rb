# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  resources :users
  resources :survey_users, only: :index
  resources :surveys do
    resources :users, except: :index, controller: 'survey_users'
    get 'answers', to: 'survey_users#index_survey'
  end
end
