class PaymentUpdateJob < ApplicationJob
  queue_as :default

  def perform(order, history)
    if history.status == 'pending'
      state = "payment"
    elsif history.status == 'complete'
      state = "completed"
    elsif history.status == 'failed'
      state = "payment"
    end
    order.update(state: state, paid_at: Time.now)
    puts "*********** Order has been updated ***********"
  end
end