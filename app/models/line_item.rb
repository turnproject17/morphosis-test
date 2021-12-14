class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  after_save :update_order_total


  def update_order_total
    order.update(order_total: order.calculate_order_total, state: 'cart')
  end
end
