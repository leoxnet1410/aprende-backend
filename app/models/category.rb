class Category < ApplicationRecord
  has_many :publications

  has_one_attached :image
  validates :name, presence: true
  validates :image, presence: true


  def image_url
    if self.image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(self.image, only_path: true)
    end
  end

  def as_json(options = {})
    super(options.merge(methods: [:image_url]))
  end
end
