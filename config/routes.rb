Rails.application.routes.draw do

  get 'uploads/new'

  get 'uploads/create'

  get 'embeddeds/new'

  get 'videos/new'

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

  get '/submit', to: 'tracks#new'
  get '/submit/manual', to: 'tracks#add_metadata'
  post '/submit/success', to: 'tracks#create'
  # get '/submit/1', to: 'track_submissions#add_source'
  # get '/submit/2', to: 'track_submissions#add_media'
  # get '/submit/3', to: 'track_submissions#add_metadata'
  # post '/submit/success', to: 'track_submissions#validate_current'


  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resource :track_submission do
    get :add_source
    get :add_media
    get :add_metadata
    post :validate_current
  end

  resources :tracks do
    resources :embeddeds, :uploads, :videos
  end

end
