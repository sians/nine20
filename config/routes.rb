Rails.application.routes.draw do

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :issues, only: [:new, :create, :edit, :update, :destroy]
    resources :medias, only: [:new, :create, :edit, :update, :destroy]
  end

  devise_for :users
  root to: 'issues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :issues, only: [:index, :show] do
    resources :medias, only: [:index, :show]
  end

  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'news', to: 'pages#news', as: 'news'
end
