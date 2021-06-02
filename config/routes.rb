Rails.application.routes.draw do
  root to: 'api/v1/records#index'

  namespace :api do
    namespace :v1 do
      resources :records, only: [:index]
    end
  end
end
