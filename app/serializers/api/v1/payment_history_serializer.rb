class Api::V1::PaymentHistorySerializer
  include JSONAPI::Serializer
  attributes :status, :transaction_detail
    
  attributes :order do |object|
    Api::V1::OrderSerializer.new(object.order)
  end

  attributes :payment_gateway do |object|
    Api::V1::PaymentGatewaySerializer.new(object.payment_gateway)
  end
end
