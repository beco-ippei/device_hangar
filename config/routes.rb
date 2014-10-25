DeviceHanger::Application.routes.draw do
  root 'devices#index'
  devise_for :users
  resources :devices do
    member do
      post 'use'
      post 'release'
    end
  end
end
