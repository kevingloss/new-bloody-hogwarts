Rails.application.routes.draw do
  # get '/students', to: '/students#index'
  resources :students, only: :index
end
