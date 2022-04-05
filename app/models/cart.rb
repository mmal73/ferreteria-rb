class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  # LOGIC
  def sub_total
    sum = 0
    order_items.each do |line_item|
      sum += line_item.total_price
    end
    sum
  end
end
