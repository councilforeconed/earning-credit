Rails.application.routes.draw do
  root 'activity#index'

  devise_for :teachers

  resources :students

  get '/teachers', to: 'teachers#index'
  get '/teachers/loan-chart', to: 'teachers#loans'

  get '/quizzes/pre-survey', to: 'quizzes#pre_survey'
  get '/quizzes/post-survey', to: 'quizzes#post_survey'
  post '/quizzes', to: 'quizzes#submit_survey'
end
