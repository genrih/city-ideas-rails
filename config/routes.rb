Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :pages, only: :show
  resources :ideas do
    resources :likes, only: [:create, :index]
  end

  root 'ideas#index'
end
