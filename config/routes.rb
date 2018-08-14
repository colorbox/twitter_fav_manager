Rails.application.routes.draw do
  root 'favorites#index'

  resource :session, only: %i(new destroy)

  resources :favorites, only: %i(index) do
    resources :tags, only: %i(create destroy)
  end
end
