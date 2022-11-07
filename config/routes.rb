Rails.application.routes.draw do

  devise_for :users
  resources :users do
    resources :ambientes
  end

  resources :questions
  
  root 'home#index'
end
