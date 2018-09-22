Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static#home"

  get '/auth/facebook/callback' => 'sessions#create' # params to user model 

  resources :users, only: [:create, :show, :destroy, :edit, :update] do
    resources :courses, only: [:index]
  end

  get '/login' => 'users#login'
  post '/signin' => 'users#sign_in'
  get '/signup' => 'users#new'

  resources :courses, only: [:index, :new, :create] do
    resources :lessons, only: [:new, :create]
  end
  get '/courses/:slug' => 'courses#show', as: 'course'
  post '/courses/:id/enroll' => 'courses#enroll'

  resources :lessons do 
    resources :contents, only: [:new, :create, :update]
  end
  post '/lessons/:id/publish' => 'lessons#publish'
  delete '/lessons/:id/delete' => 'lessons#destroy', as: 'delete_lesson'

  resources :categories, only: [:index, :show]


end
