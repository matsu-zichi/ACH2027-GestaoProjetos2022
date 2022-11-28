Rails.application.routes.draw do
  
  devise_for :users

  resources :users do
    resources :ambientes do
      resources :exams do
        resources :questions
      end
    end
  end

  
  root 'home#index'
end
