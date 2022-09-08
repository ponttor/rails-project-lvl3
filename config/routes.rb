# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do 
    root 'bulletins#index'
    resources :bulletins, exept: :index
    resource :profile, only: :show
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
    # delete 'auth/:provider/sign_out', to: 'auth#sign_out'
    resource :session, only: :destroy

    resources :bulletins do
      member do
        patch 'archive'
        patch 'moderate'
      end
    end

    namespace :admin do 
      root 'home#admin'
      resources :categories, except: :show
      resources :bulletins, only: :index do
        member do
          patch 'archive'
          patch 'publish'
          patch 'reject'
        end
      end
    end
  end
end


# scope 
# namespace - папка и путь
# module - только папка