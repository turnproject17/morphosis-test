class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :title, null: false
      t.string :country
      t.integer :currency, default: 0
      t.decimal :tax, default: "0.0"

      t.timestamps
    end
  end
end
