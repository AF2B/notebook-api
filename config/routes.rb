Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: %i[show]
    resource :kind, only: %i[show], path: 'relationships/kind'

    resource :phones, only: %i[show]
    resource :phones, only: %i[show], path: 'relationships/phones'

    resource :address, only: %i[show update]
    resource :address, only: %i[show update], path: 'relationships/address'
  end
end
