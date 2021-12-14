class ::Api::V1::CartsController < Api::V1::ApplicationController
  def show
    @order = current_order
    render json: Api::V1::OrderSerializer.new(@order).serializable_hash, status: :ok
  end

  def update
    if current_order.update(permitted_params)
      render json: Api::V1::OrderSerializer.new(current_order).serializable_hash, status: :ok
    else
      render json: { alert: "Order has been updated." }, status: :ok
    end
  end

  private

  def permitted_params
    params.require(:order).permit(:customer_name, :shipping_address, line_items_attributes: [:id, :product_id, :quantity, :amount, :_destroy])
  end
end
