Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static#home"

  resources :users, only: [:create, :show]
  get '/login' => 'users#login'
  get '/signup' => 'users#new'

end
