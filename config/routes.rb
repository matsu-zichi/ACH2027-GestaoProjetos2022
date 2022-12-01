Rails.application.routes.draw do
  
  devise_for :users

  resources :users do
    resources :ambientes do
      resources :exams do
        resources :questions
      end
    end
  end

  get '/users/:user_id/ambientes/:id/adicionar', to: 'ambientes#adicionar_aluno'
  post '/users/:user_id/ambientes/:id/adicionar', to: 'ambientes#redirect_user_adicionado'
  post '/users/:user_id/ambientes/:id_ambiente/exam/:id_exam/question/:id_question/resposta0', to: 'question#resposta'
  
  root 'home#index'
end
