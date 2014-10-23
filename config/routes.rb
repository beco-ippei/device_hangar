DeviceHanger::Application.routes.draw do
  resources :devices do
    member do
      post 'use'
      post 'release'
    end
  end
end
