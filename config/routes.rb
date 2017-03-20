Rails.application.routes.draw do

  get 'track_submissions/add_source'

  get 'track_submissions/add_media'

  get 'track_submissions/publish'

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

  get '/submit', to: 'track_submissions#new'
  post '/submit', to: 'track_submissions#create'


  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :track_submissions, only: [:new, :create]
  resources :tracks do
    resources :embeddeds
    resources :uploads
    resources :videos
  end

end
