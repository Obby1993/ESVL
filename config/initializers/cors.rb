Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://esvl.herokuapp.com/commandes'
    resource '*', headers: :any, methods: [:get, :post]
  end
end
