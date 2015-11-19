Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources :companies, only: [:new, :create, :destroy]
  end

  devise_for :users
  root to: 'static#index'
  get 'about' => 'static#about'
  get 'contact' => 'static#contact'

  resources :companies, only: [:index, :show, :edit, :update] do
    resources :products
  end
end
