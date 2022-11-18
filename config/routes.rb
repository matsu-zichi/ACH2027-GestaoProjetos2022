Rails.application.routes.draw do
  resources :exams

  devise_for :users
  resources :users do
    resources :ambientes
  end

  resources :questions
  
  root 'home#index'
end
