Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  get 'my_send_proposals', to: 'profiles#my_send_proposals'
  resources :profiles, only:[:new, :create, :show, :edit, :update] do
    resources :ads, only: [:index]
  end

  get 'filter/ads', to: 'ads#filter'

  resources :ads, only: [:new, :create, :show] do
    post 'finish', to: 'ads#finish'
    resources :proposals, only:[:new, :create, :show]
  end

end
