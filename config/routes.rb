Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'tracks#index'

  get '/about', to:'static_pages#about'
  get '/help', to:'static_pages#help'
  get '/contact', to:'static_pages#contact'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/submit', to: 'tracks#submit'
  post '/submit/embed', to: 'embedded#create'
  post '/submit/upload', to: 'upload#create'


  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :tracks, :embeddeds, :uploads

  # resources :tracks do
  #   resources :embeddeds, :uploads
  # end

end
