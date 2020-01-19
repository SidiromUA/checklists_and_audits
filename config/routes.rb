Rails.application.routes.draw do
  devise_for :users
  resources :items
  root 'items#index'
  resources :questions
  root 'questions#index'
end
