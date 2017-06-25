Rails.application.routes.draw do

  get 'hello_world', to: 'hello_world#index'
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

  get '/submit', to: 'embeddeds#new'
  get '/submit/embed', to: 'embeddeds#new'
  get '/submit/upload', to: 'uploads#new'
  post '/submit/embed', to: 'embeddeds#create'
  post '/submit/upload', to: 'uploads#create'


  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :tracks, :uploads, :embeddeds

  resources :tracks do
    resources :embeddeds, only: [:index, :show, :edit, :update, :destroy]
    resources :uploads, only: [:index, :show, :edit, :update, :destroy]
  end

end
