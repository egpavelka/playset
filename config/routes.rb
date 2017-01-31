Rails.application.routes.draw do
  root 'account_pages#accounthome'
  get '/login', to: 'account_pages#login'
  get '/signup', to:'account_pages#signup'
  get '/profile', to:'account_pages#publicprofile'
  get '/profile/view', to:'account_pages#myprofile'
  get '/profile/edit', to:'account_pages#manageprofile'
  get '/account/edit', to:'account_pages#manageaccount'
  get '/account', to:'account_pages#accounthome'

  root 'playlists_pages#top'
  get '/playlists', to:'playlists_pages#top'
  get '/playlists/top', to:'playlists_pages#top'
  get '/playlists/new', to:'playlists_pages#new'
  get '/playlists/recommended', to:'playlists_pages#recommended'
  get '/playlists/favorites', to:'playlists_pages#favorites'

  root 'charts_pages#top'
  get '/charts', to:'charts_pages#top'
  get '/charts/top', to:'charts_pages#top'
  get '/charts/new', to:'charts_pages#new'
  get '/charts/recommended', to:'charts_pages#recommended'

  root 'static_pages#home'
  get '/home', to:'static_pages#home'
  get '/about', to:'static_pages#about'
  get '/help', to:'static_pages#help'
  get '/contact', to:'static_pages#contact'
  # For details on the DSL available within this file, see http:##guides.rubyonrails.org#routing.html
end
