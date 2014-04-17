TwoCents::Application.routes.draw do
  root 'welcomes#show'

  resource :dashboard, only: [:show]
  resources :users, only: [:create]

  resources :discussions, only: [:new, :show] do
    resources :comments, only: [:create]
    resource :username, only: [:create]
  end

  resources :content_discussion_forms, only: [:create]
end
