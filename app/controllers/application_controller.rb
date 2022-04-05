# cart
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_cart

  private

  def current_cart
    if session[:cart_id].nil?
      @current_cart = Cart.create
    end
    @current_cart = Cart.find_by(id: session[:cart_id])
    if @current_cart.nil?
      @current_cart = Cart.create
    end
    session[:cart_id] = @current_cart.id
  end
end
