class CartsController < ApplicationController
  before_action :set_cart, only: %i[show update destroy]

  # GET/carts/ (See all carts)
  def index
    @carts = Cart.all

    render json: @carts
  end
  # GET/carts/:cart_id (See cart with it's orders)
  def show

    render json: @cart
  end

  def total_calculator
    @cart.orders.each do |order|
      @cart[:total] += order.subtotal
    end
    @cart.save
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
    total_calculator
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:cart).permit(
      :cart_id, :order_id,
      orders_attributes: [:product_type, :name, :price]
    )
  end
end
