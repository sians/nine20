Rails.application.routes.draw do

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :issues
    resources :medias

    # devise_for :users, controllers: {registrations: "admin/registrations"}

    # devise_scope :user do
    #   get 'users', to: 'registrations#index'
    # end
    get 'users', to: 'registrations#index', as: 'users'

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
