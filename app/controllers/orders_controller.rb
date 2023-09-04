class OrdersController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy ]
  # GET/cart/:cart_id/orders
  # def index
  #   @orders = Order.all

  #   render json: @orders
  # end

  # GET/cart/:cart_id/orders
  def show
    render json: @orders #include: [:phones, :kind, :address]
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(
      :order_id,
      order_attributes: [:product_id, :quantity, :_destroy]
    )
  end
end
