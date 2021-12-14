class Api::V1::RegionSerializer
  include JSONAPI::Serializer
  attributes :title, :country, :currency, :tax

end
