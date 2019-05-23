Rails.application.routes.draw do
  resources :plants, only: :destroy

  resources :gardens do
    resources :plants, only: :create
  end

  resources :plants, only: [] do
    resources :plant_tags, only: [:new, :create]
  end

  root to: 'gardens#index'
end
