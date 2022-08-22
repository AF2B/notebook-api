Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: %i[show]
    resource :kind, only: %i[show], path: 'relationships/kind'
  end
end
