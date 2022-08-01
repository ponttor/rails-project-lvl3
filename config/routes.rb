# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do 
    root 'bulletins#index'
    resources :bulletins, only: %i[show new create]
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth


    namespace :admin do 
      root 'home#admin'
    end
  end
end


# scope 
# namespace - папка и путь
# module - только папка