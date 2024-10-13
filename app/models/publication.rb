class Publication < ApplicationRecord
  belongs_to :category
  has_one_attached :image # Solo una imagen

  # Validaciones
  validates :name, :price, :location, :description, :category_id, presence: true
  validates :image, presence: true # La imagen es obligatoria

  # Método para devolver la URL de la imagen
  def image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      nil
    end
  end

  def as_json(options = {})
    super(options.merge(methods: [:image_url]))
  end
end