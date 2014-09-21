Rails.application.routes.draw do
  root 'activity#index'
  
  devise_for :teachers
  
  resources :students
  
  get '/quizzes/pre-survey', to: 'quizzes#pre_survey'
  get '/quizzes/post-survey', to: 'quizzes#post_survey'
end
