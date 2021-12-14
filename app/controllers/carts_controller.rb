class CartsController < ApplicationController
  def update
    if current_order.update(permitted_params)
      redirect_back fallback_location: '/'
    end
  end

  def show
    
  end

  private

  def permitted_params
    params.require(:order).permit(:customer_name, :shipping_address, line_items_attributes: [:id, :product_id, :quantity, :amount, :_destroy])
  end
end
