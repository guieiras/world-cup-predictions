Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users, only: Clearance.configuration.user_actions do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  resources :predictions, only: [:index, :create]
  resources :matches, only: :index

  namespace :admin do
    resources :matchdays, only: [:index, :edit, :update]
  end
end
