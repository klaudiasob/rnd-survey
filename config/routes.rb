# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  devise_scope :admin do
    authenticated :admin do
      root 'surveys#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users
  resources :survey_users, only: :index
  resources :surveys do
    resources :users, except: :index, controller: 'survey_users'
    get 'answers', to: 'survey_users#index_survey'
  end


end
