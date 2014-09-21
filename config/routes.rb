Rails.application.routes.draw do
  root 'activity#index'
  
  devise_for :teachers
  
  resources :students
end
