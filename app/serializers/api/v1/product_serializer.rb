class Api::V1::ProductSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :image_url, :price, :sku, :stock

  attribute :region do |object|
    Api::V1::RegionSerializer.new(object.region)
  end
end
