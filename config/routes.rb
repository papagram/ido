Rails.application.routes.draw do
  resources :trainings, only: [:index] do
    collection do
      get :message
      get :tasks
    end
  end

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
