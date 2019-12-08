Rails.application.routes.draw do

  devise_for :users

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :issues
    resources :medias

    get 'users', to: 'registrations#index', as: 'users'
    get 'users/new', to: 'registrations#new', as: 'new_user'
    post 'users', to: 'registrations#create', as: 'create_user'
    get 'users/:id/edit', to: 'registrations#edit', as: 'edit_user'
    put 'users/:id/update', to:'registrations#update', as: 'update_user'
    delete 'users/:id', to: 'registrations#destroy', as:  'delete_user'
  end

  root to: 'issues#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :issues, only: [:index, :show] do
    resources :medias, only: [:index, :show]
  end

  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'news', to: 'pages#news', as: 'news'
end
