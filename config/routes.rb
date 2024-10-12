Rails.application.routes.draw do
  resources :publications do
    collection do
      get 'category/:category_name', to: 'publications#by_category', as: 'by_category'
    end
  end

  resources :categories, only: [:index, :show]

  # Agregar una ruta para los productos que redirija a las publicaciones
  get 'products/category/:category_name', to: 'publications#by_category', as: 'products_by_category'
end