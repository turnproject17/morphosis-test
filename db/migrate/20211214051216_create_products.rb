class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.string :image_url
      t.decimal :price, default: 0.0
      t.string :sku, index: true
      t.integer :stock, default: 0
      t.integer :region_id, index: true

      t.timestamps
    end
  end
end
