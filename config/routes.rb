Rails.application.routes.draw do

  get 'index', to: 'welcome#index'
  get 'about', to: 'welcome#about'

  resources :articles

  root 'welcome#index'

end
