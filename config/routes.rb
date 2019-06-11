Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      resources :students
      resources :trainers
      resources :courses
      resources :teams
      resources :enrrolments
    end
  end
end
