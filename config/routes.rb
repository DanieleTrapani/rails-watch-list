Rails.application.routes.draw do
  # resources :lists, only: %i[index show new create]
  resources :lists do
    resources :bookmarks, only: %i[new create destroy]
  end
  # resources :bookmarks, only: [:destroy]
end
