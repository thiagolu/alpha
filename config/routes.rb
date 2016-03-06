Rails.application.routes.draw do

  resources :categories, except: [:destroy]

  get 'index', to: 'welcome#index'
  get 'about', to: 'welcome#about'

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'header', to: 'welcome#header'
  
  get 'bills/:id/pay', to: 'bills#pay', as:'pay'
  
  resources :users, except: 'new'
  resources :articles
  resources :bills


  root 'welcome#index'

end
