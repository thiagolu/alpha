Rails.application.routes.draw do

  get 'index', to: 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'bills/index', to: 'bills#index'


  resources :articles

  root 'welcome#index'

end
