class Api::V1::OrderSerializer
  include JSONAPI::Serializer
  attributes :number, :customer_name, :shipping_address, :order_total, :paid_at, :state
  
  attributes :line_items do |object|
    Api::V1::LineItemSerializer.new(object.line_items)
  end
end
