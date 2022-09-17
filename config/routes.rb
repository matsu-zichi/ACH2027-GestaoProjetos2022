Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # sintaxe: root "controller_name#action_name"
  # root "articles#index"
  root "application#hello"
end
