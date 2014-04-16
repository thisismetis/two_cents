TwoCents::Application.routes.draw do
  root 'welcomes#show'

  resource :dashboard, only: [:show]
  resources :users, only: [:create]
  resources :discussions, only: [:new, :create, :show] do
    resources :comments, only: [:create]
    resource :username, only: [:create]
  end
end
