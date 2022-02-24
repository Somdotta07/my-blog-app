Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[new create index show]
   end
    resources :posts do
    resources :comments, only: %i[create]
      resources :likes, only: %i[create]
  end
end
