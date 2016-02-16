Rails.application.routes.draw do


  get 'index', to: 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'bills/index', to: 'bills#index'

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'header', to: 'welcome#header'
  
  
  resources :users, except: 'new'
  resources :articles
  resources :categories, except: [:destroy]


  root 'welcome#index'

end
