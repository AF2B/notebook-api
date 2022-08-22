Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: %i[show]
  end
end
