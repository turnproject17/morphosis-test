class ::Api::V1::ProductsController < Api::V1::ApplicationController
  def index
    @products = Product.available.includes(:region)
    render json: Api::V1::ProductSerializer.new(@products).serializable_hash, status: :ok
  end

  def show
    @product = Product.available.find(params[:id])
    render json: Api::V1::ProductSerializer.new(@product).serializable_hash, status: :ok
  end
end
