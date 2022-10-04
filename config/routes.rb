Rails.application.routes.draw do
  root 'home#index'
  resources :questions
  delete 'questions/:id', to: 'questions#delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # sintaxe: root "controller_name#action_name"
end
