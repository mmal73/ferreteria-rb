class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # LOGIC
  def total_price
    quantity * product.price
  end
end
