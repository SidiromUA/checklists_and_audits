Rails.application.routes.draw do
  root 'checklists#index'
  devise_for :users
  resources :checklists do 
    resources :questions
  end
end
