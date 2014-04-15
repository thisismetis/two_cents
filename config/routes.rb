TwoCents::Application.routes.draw do
  root 'welcomes#show'

  resources :users, only: [:create]
  resource :dashboard, only: [:show]

  resources :discussions, only: [:new, :create, :show] do
    resources :contents, only: [:new, :create]
  end
end
