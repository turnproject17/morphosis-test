class Api::V1::OrdersController < Api::V1::ApplicationController
  def index
    @orders = Order.completed.includes(:region)
    render json: Api::V1::OrderSerializer.new(@orders).serializable_hash, status: :ok
  end

  def show
    @order = Order.available.find(params[:id])
    render json: Api::V1::OrderSerializer.new(@order).serializable_hash, status: :ok
  end

  def next
    if current_order.next
      render json: Api::V1::OrderSerializer.new(current_order).serializable_hash, status: :ok
    end
  end
end
