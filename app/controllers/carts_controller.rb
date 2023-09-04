class CartsController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]
  # GET/carts/
  def index
    @carts = Cart.all

    render json: @carts, include: [:orders]
  end
  # GET/carts/:cart_id
  def show
    render json: @cart, include: [:orders]
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
