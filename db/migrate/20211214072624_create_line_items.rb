class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity, default: 0
      t.decimal :amount, default: 0.0

      t.timestamps
    end
  end
end
