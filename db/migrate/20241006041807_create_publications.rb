class CreatePublications < ActiveRecord::Migration[7.2]
  def change
    create_table :publications do |t|
      t.string :name
      t.decimal :price
      t.string :location
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end