Rails.application.routes.draw do
  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
    root 'application#index'

    resources :companies, only: [:new, :create, :destroy]
    resources :users
  end

  devise_for :users
  root to: 'static#index'
  get 'about' => 'static#about'
  get 'contact' => 'static#contact'

  resources :companies, only: [:index, :show, :edit, :update] do
    resources :products
  end
end
