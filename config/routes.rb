Rails.application.routes.draw do
  get 'account_pages/login'

  get 'account_pages/signup'

  get 'account_pages/public-profile'

  get 'account_pages/my-profile'

  get 'account_pages/manage-profile'

  get 'account_pages/manage-account'

  get 'account_pages/account-home'

  get 'playlists_pages/top'

  get 'playlists_pages/new'

  get 'playlists_pages/recommended'

  get 'playlists_pages/favorites'

  get 'charts_pages/top'

  get 'charts_pages/new'

  get 'charts_pages/recommended'

  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/help'
  get 'static_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
