Rails.application.routes.draw do
  root 'tracks#index'

  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/submit', to: 'tracks#submit'
  get '/submit/embed', to: 'embeddeds#new'
  get '/submit/upload', to: 'uploads#new'
  post '/submit/embed', to: 'embeddeds#create'
  post '/submit/upload', to: 'uploads#create'


  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :tracks, only: [:edit, :destroy]
  resources :uploads, only: [:new, :create]
  resources :embeddeds, only: [:new, :create]

  resources :follows, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

  resources :tracks do
    resources :comments, :likes
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

end
