Rails.application.routes.draw do
  # get '/students', to: 'students#index'
  resources :students, only: :index
  resources :students, only: :show
  get '/courses', to: 'courses#index'
end
