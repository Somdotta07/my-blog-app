Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index create new show destroy]
  end

  resources :posts do
    resources :comments, only: %i[create new update destroy]
    resources :likes, only: %i[create]
  end

  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
