Rails.application.routes.draw do
  devise_for :customers, controllers: {
  	sessions: 'devise/customers/sessions',
  	passwords: 'devise/customers/passwords',
  	registrations: 'devise/customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
