Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "sessions/new"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "static_pages#home"
  resources :contacts, only: %i[index create]

  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/gallery", to: "static_pages#gallery"
  get "/gallery/:id", to: "static_pages#designs_detail"
  get "/faq", to: "static_pages#faq"
  # get "/contacts", to: "static_pages#contacts"

  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
