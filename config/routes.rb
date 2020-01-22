Rails.application.routes.draw do
  root 'checklists#index'
  devise_for :users
  resources :checklists
  resources :questions
end
