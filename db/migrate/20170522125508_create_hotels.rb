class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :title
      t.text :description
      t.boolean :breakfast
      t.decimal :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
