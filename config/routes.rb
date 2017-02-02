Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :messages, only: [:create, :index]
  end
  root 'messages#index'
end
