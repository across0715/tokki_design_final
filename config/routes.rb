Rails.application.routes.draw do
  get 'users/new'
  root to: "static_pages#home"
  get '/home',        to: 'static_pages#home'
  get '/about',       to: 'static_pages#about'
  get '/gallery',     to: 'static_pages#gallery'
  get '/faq',        to: 'static_pages#faq'

  get "posts/index", to: "posts#index"
  
end
