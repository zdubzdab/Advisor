class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
