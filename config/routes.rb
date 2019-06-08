Rails.application.routes.draw do
  get 'login', to: redirect('/auth/line'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'auth/line/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  root 'home#index'
end
