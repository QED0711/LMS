Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static#home"

  resources :users, only: [:create, :show, :destroy, :edit, :update] do
    resources :courses, only: [:index]
  end

  get '/login' => 'users#login'
  post '/signin' => 'users#sign_in'
  get '/signup' => 'users#new'

  resources :courses, only: [:index] do
    resources :lessons, only: [:new, :create]
  end
  get '/courses/:slug' => 'courses#show'
  post '/courses/:id/enroll' => 'courses#enroll'

  resources :lessons do 
    resources :contents, only: [:new, :create, :edit, :update, :destroy]
  end
  post '/lessons/:id/publish' => 'lessons#publish'

  resources :categories, only: [:index, :show]


end
