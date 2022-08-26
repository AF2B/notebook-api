Rails.application.routes.draw do
  resources :kinds

  api_version(module: 'V1', path: { value: 'v1' }) do
    resource :users, only: [:create]

    resources :contacts do
      resource :kind, only: %i[show]
      resource :kind, only: %i[show], path: 'relationships/kind'

      resource :phones, only: %i[show]
      resource :phone, only: %i[create update destroy]
      resource :phones, only: %i[show], path: 'relationships/phones'
      resource :phone, only: %i[create update destroy], path: 'relationships/phones'

      resource :address, only: %i[show update create destroy]
      resource :address, only: %i[show update create destroy], path: 'relationships/address'

      # get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
    end
  end

  api_version(module: 'V2', path: { value: 'v2' }) do
    resources :contacts do
      resource :kind, only: %i[show]
      resource :kind, only: %i[show], path: 'relationships/kind'

      resource :phones, only: %i[show]
      resource :phone, only: %i[create update destroy]
      resource :phones, only: %i[show], path: 'relationships/phones'
      resource :phone, only: %i[create update destroy], path: 'relationships/phones'

      resource :address, only: %i[show update create destroy]
      resource :address, only: %i[show update create destroy], path: 'relationships/address'

      # get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
    end
  end
end
