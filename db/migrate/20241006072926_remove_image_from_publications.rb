class RemoveImageFromPublications < ActiveRecord::Migration[7.2]
  def change
    remove_column :publications, :image, :string
  end
end
