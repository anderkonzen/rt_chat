Rails.application.routes.draw do
  root 'messages#index'

  resources :messages

  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  mount ActionCable.server, at: '/cable'
end
