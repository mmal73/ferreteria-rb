class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new({
      "name" => 'user1',
      "email" => 'user1@mail.com',
      "address" => 'user1 address',
      "pay_method" => 'Tarjet'
    })
    @current_cart.order_items.each do |item|
      @order.order_items << item
    end
    @order.save!
    #Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end
