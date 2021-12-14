class Order < ApplicationRecord
  enum state: %w{cart payment completed canceled}
  belongs_to :user
  has_many :line_items
  has_many :payment_histories
  scope :incomplete, ->{ where.not(state: ['completed', 'canceled']) }

  before_create :set_number

  accepts_nested_attributes_for :line_items, allow_destroy: true
  self.states.keys.each do |state|
    define_singleton_method "#{state}" do
      where(state: state)
    end
  end

  def calculate_order_total
    total = 0
    line_items.each do |li|
      total += (li.product&.price * li.quantity)
    end
    total
  end

  def next
    self.state = self.class.states[state] + 1
    save
  end

  private

  def set_number
    self.number = "SS" + SecureRandom.hex(5)
  end
end
