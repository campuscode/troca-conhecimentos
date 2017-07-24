Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :profiles, only:[:new, :create, :show]
  resources :ads, only: [:new, :create, :show] do
    resources :proposals, only:[:new, :create, :show]
  end
end
