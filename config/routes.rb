Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events do
    resources :event_teams, only: [:new, :create, :destroy, :edit, :update, :show]
  end
  resources :articles
  resources :commandes, only: [:index, :create, :show]
  post "commande/create", to: "commande#create"
  get "success", to: "commande#success"
  get "cancel", to: "commande#cancel"
  # resources :payments, only: :new
  resources :esvl_teams

  post "articles/add_to_panier/:id", to: "articles#add_to_panier", as: "add_to_panier"
  post "articles/remove_from_panier/:id", to: "articles#remove_from_panier", as: "remove_from_panier"

  get "success", to: "commande#success"
  get "cancel", to: "commande#cancel"

  mount StripeEvent::Engine, at: '/webhook'
end
