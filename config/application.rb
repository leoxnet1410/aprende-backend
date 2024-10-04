require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Configuración de CORS
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3001'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true  # Mover credentials aquí
      end
    end
  end
end
