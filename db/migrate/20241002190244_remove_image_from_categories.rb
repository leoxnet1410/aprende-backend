class RemoveImageFromCategories < ActiveRecord::Migration[7.2]
  def change
    remove_column :categories, :image, :string
  end
end
