TwoCents::Application.routes.draw do
  root 'welcomes#show'

  resources :users, only: [:create]
  resource :dashboard, only: [:show]
end
