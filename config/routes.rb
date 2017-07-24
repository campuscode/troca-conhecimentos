Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :profiles, only:[:new, :create, :show, :edit, :update]


    get 'filter/ads', to: 'ads#filter'



end
