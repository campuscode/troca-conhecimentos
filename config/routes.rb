Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :profiles, only:[:new, :create, :show]

  resources :ads, only:[] do
    get 'filter', on: :collection
  end

end
