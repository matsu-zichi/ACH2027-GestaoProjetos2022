Rails.application.routes.draw do
  

  devise_for :users
  resources :users do
    resources :ambientes do
      resources :exams
    end
  end

  resources :questions
  
  root 'home#index'
end
