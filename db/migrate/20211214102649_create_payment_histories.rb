class CreatePaymentHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_histories do |t|
      t.integer :order_id, index: true
      t.integer :payment_gateway_id
      t.integer :status, default: 0
      t.string :transaction_detail

      t.timestamps
    end
  end
end
