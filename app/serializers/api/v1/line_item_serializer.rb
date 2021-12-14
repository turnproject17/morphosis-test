class Api::V1::LineItemSerializer
  include JSONAPI::Serializer
  attributes :quantity, :amount
  
  attributes :product do |object|
    Api::V1::ProductSerializer.new(object.product)
  end
end
