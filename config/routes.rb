Rails.application.routes.draw do
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "questions#index"
  # Defines the root path route ("/")
  # sintaxe: root "controller_name#action_name"
  # root "articles#index"
  # root "application#hello"
end
