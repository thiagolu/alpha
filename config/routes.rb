Rails.application.routes.draw do

  get 'index', to: 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'bills/index', to: 'bills#index'

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  resources :articles

  root 'welcome#index'

end
