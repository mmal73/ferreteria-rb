class OrderItemsController < ApplicationController
  before_action :fetch_current_product, only: [:create]
  before_action :fetch_order_item, only: %i[destroy add_quantity reduce_quantity]

  def create
    if @current_cart.products.include?(@chosen_product)
      @order_item = current_cart.order_items.find_by(product_id: @chosen_product)
      @order_item.quantity += 1
    else
      @order_item = OrderItem.new(quantity: 1)
      @order_item.cart = @current_cart
      @order_item.product = @chosen_product
    end
    @order_item.save
    redirect_to cart_path
  end

  def destroy
    @current_order_item.destroy
    redirect_to cart_path
  end

  def add_quantity
    @current_order_item.quantity += 1
    @current_order_item.save
    redirect_to cart_path
  end

  def reduce_quantity
    @current_order_item.quantity -= 1 if @current_order_item.quantity > 1
    @current_order_item.save
    redirect_to cart_path
  end

  private

  def fetch_order_item
    @current_order_item = OrderItem.find(params[:id])
  end

  def fetch_current_product
    @chosen_product = Product.find(params[:product_id])
  end
end
