Rails.application.routes.draw do
  devise_for :users

  resources :pages
  resources :ideas do
    resources :likes, only: [:create, :index]
  end

  root 'ideas#index'
end
