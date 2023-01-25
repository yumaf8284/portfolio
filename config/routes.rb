Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'pages#index'
  get 'pages/help'

  resources :topics 
 
    get 'favorites/index'
    post '/favorites', to: 'favorites#create'
    delete '/favorites', to: 'favorites#destroy'


  get 'comments/new'
  post '/comments', to: 'comments#create'

end
