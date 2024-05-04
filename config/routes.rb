Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'
  get '/welcome', to: 'welcome#completed_tasks'
  post '/welcome', to: 'welcome#index' # Rota para receber a ação POST do formulário
end
