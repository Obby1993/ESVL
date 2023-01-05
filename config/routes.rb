Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events do
    resources :event_teams, only: [:new, :create, :destroy, :edit, :update, :show]
  end
  resources :articles
  resources :commandes, only: [:index, :create] do
    resources :payments, only: :new
  end
  resources :esvl_teams

  mount StripeEvent::Engine, at: '/webhook'
end
