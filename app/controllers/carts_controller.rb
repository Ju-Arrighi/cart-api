class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy ]

  # GET/carts/ (See all carts)
  def index
    @carts = Cart.all

    render json: @carts, include: [:orders, products_attributes: [:product_type, :name, :price]]
  end
  # GET/carts/:cart_id (See cart with it's orders)
  def show
    render json: @cart, include: [:orders]
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:cart).permit(
      :cart_id, :product_id,
      products_attributes: [:product_type, :name, :price]
    )
  end
end
