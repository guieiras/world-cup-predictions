Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users, only: Clearance.configuration.user_actions do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  resources :leagues, only: [:index, :show, :new, :create] do
    get 'members'
  end
  resources :league_participations, only: [:create, :destroy]
  resources :matches, only: :index
  resources :predictions, only: [:index, :create] do
    collection do
      get :current
    end
  end

  namespace :admin do
    resources :matches, only: [:index, :update]
    resources :settings, only: [:index, :create]
  end
end
