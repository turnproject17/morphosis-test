class PaymentHistory < ApplicationRecord
  belongs_to :order
  belongs_to :payment_gateway

  enum status: %w{pending complete failed}

  after_create :update_status_order


  private

  def update_status_order
    PaymentUpdateJob.perform_now(order, self)
  end
end
