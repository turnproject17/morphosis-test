class ::Api::V1::PaymentsController < Api::V1::ApplicationController
  def create
    current_order.next if current_order.state == 'cart'
    @payment_history = current_order.payment_histories.new(permitted_params)
    if @payment_history.save
      render json: Api::V1::PaymentHistorySerializer.new(@payment_history).serializable_hash, status: :created
    else
      render json: { alert: "Something went wrong." }, status: 422
    end
  end

  def show
    @payment_history = current_order.payment_histories.new(permitted_params)
    if @payment_history
      render json: Api::V1::PaymentHistorySerializer.new(@payment_history).serializable_hash, status: :created
    else
      render json: { alert: "Something went wrong." }, status: 422
    end
  end

  private

  def permitted_params
    params.require(:payment_history).permit(:payment_gateway_id, :status, :transaction_detail)
  end
end
