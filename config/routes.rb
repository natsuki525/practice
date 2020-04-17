Rails.application.routes.draw do

  root 'home#top'
  devise_for :admins, controllers: {
  	sessions: 'devise/admin/sessions',
  	passwords: 'devise/admin/passwords',
  	registrations: 'devise/admin/registrations'
  }
  devise_for :customers, controllers: {
  	sessions: 'devise/customers/sessions',
  	passwords: 'devise/customers/passwords',
  	registrations: 'devise/customers/registrations'
  }
  resource :customer, only: [:show, :edit, :update, :destroy]
  resources :shippings, except: [:show]
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
