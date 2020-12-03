Rails.application.routes.draw do

  get 'sessions/new'
  root to: "static_pages#home"
  get '/home',        to: 'static_pages#home'
  get '/about',       to: 'static_pages#about'
  get '/gallery',     to: 'static_pages#gallery'
  get '/faq',         to: 'static_pages#faq'

  get  '/signup',     to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
  
end
