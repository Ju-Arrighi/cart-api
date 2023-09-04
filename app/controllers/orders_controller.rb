class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]
  # GET/cart/:cart_id/orders
  def index
    @orders = Order.all

    render json: @orders # include: [:products]
  end

  # GET/cart/:cart_id/orders
  def show
    render json: @orders
  end

  private

  def set_order
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(
      :cart_id, :product_id,
      product_attributes: [:product_type, :product_name, :_destroy]
    )
  end
end
