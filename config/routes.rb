Rails.application.routes.draw do

  root to: "application#not_found"

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      resources :students
      resources :teachers
      resources :subjects
      resources :grades
      resources :enrollments
      resources :employers
    end
  end
end
