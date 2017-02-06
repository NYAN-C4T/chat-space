Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :messages, only: %i(index create)
  end
  root 'messages#index'
end
