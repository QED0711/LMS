Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static#home"

  resources :users, only: [:create, :show, :destroy, :edit, :update] do
    resources :courses, only: [:index]
  end

  get '/login' => 'users#login'
  post '/signin' => 'users#sign_in'
  get '/signup' => 'users#new'

  resources :courses, only: [:index]
  get '/courses/:slug' => 'courses#show'

  resources :lessons do 
    resources :contents, only: [:new, :create, :edit, :update, :destroy]
  end
  post '/lessons/:id/publish' => 'lessons#publish'


end
