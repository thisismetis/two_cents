TwoCents::Application.routes.draw do
  root 'welcomes#index'

  resources :users, only: [:create]
  resource :dashboard, only: [:show]
end
