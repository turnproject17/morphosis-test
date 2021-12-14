class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :number, null: false
      t.string :customer_name
      t.integer :user_id
      t.text :shipping_address
      t.decimal :order_total, default: 0.0
      t.datetime :paid_at
      t.integer :adjustment_id

      t.timestamps
    end
  end
end
