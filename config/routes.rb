Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: %i[show]
    resource :kind, only: %i[show], path: 'relationships/kind'

    resource :phones, only: %i[show]
    resource :phone, only: %i[create update destroy]
    resource :phones, only: %i[show], path: 'relationships/phones'
    resource :phone, only: %i[create update destroy], path: 'relationships/phones'

    resource :address, only: %i[show update create destroy]
    resource :address, only: %i[show update create destroy], path: 'relationships/address'

    get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
  end
end
