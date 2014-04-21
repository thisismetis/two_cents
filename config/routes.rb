TwoCents::Application.routes.draw do
  root 'welcomes#show'

  resource :dashboard, only: [:show]
  resources :users, only: [:create]

  resources :discussions, only: [:new, :show, :create] do
    resource :status, only: [:update]
    resources :comments, only: [:create]
    resource :username, only: [:create]
  end
end
