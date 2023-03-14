Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://esvl.herokuapp.com/articles'
    resource '/commandes', headers: :any, methods: [:get, :post]
  end
end
