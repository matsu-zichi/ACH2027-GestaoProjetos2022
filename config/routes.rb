Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # sintaxe: root "controller_name#action_name"
end
