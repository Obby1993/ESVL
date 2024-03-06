Rails.application.routes.draw do
  get 'entrainements/new'
  get 'entrainements/create'
  get 'entrainements/destroy'
  get 'gymnases/new'
  get 'gymnases/create'
  get 'gymnases/destroy'
  devise_for :users
  root "pages#home"
  get "club", to: "pages#club"
  get "vie_sportive", to: "pages#vie_sportive"
  get "saison", to: "pages#saison"
  get "contact", to: "pages#contact"
  post '/contact', to: 'pages#envoyer_email'

  # get '/pdf/:filename', to: 'pdf#show', as: :pdf_download
  get '/assets/images/:filename', to: 'images#show', as: 'image'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events do
    resources :event_teams, only: [:new, :create, :destroy, :edit, :update, :show]
  end
  resources :employes, only: [:new, :create]
  resources :partenaires, only: [:new, :create, :edit, :update, :destroy]
  resources :articles
  resources :commandes, only: [:index, :create, :show]
  post "commande/create", to: "commande#create"
  get "success", to: "commande#success"
  get "cancel", to: "commande#cancel"
  # resources :payments, only: :new
  resources :esvl_teams

  resources :next_games, only: [:index, :new]
  post '/import_csv', to: 'next_games#import', as: 'import_csv'

  resources :documents, only: [ :new, :create, :destroy]
  resources :gymnases, only: [:new, :create, :destroy]
  resources :entrainements, only: [:new, :create, :destroy]

  post "articles/add_to_panier", to: "articles#add_to_panier", as: "add_to_panier"
  post "articles/remove_from_panier/:id", to: "articles#remove_from_panier", as: "remove_from_panier"

  patch "articles/article_display/:id", to: "articles#article_display", as: "article_display"

  get "success", to: "commande#success"
  get "cancel", to: "commande#cancel"

  mount StripeEvent::Engine, at: '/webhook'
end
