class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show create update destroy ]
  # GET/cart/:cart_id/orders
  def index
    @orders = Order.all

    render json: @orders # include: [:products]
  end

  # GET/cart/:cart_id/orders
  def show
    render json: @orders
  end

  # POST /carts/:cart_id/orders
  def create
    # verify_purchase
    # library_purchases = @library.purchases
    # expire(library_purchases)
    @cart.orders << Order.new(order_params)
    if @cart.save
      render json: @cart.orders, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @cart = Cart.find(params[:cart_id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(
      :cart_id, :product_id, :quantity,
      product_attributes: [:product_type, :product_name, :_destroy]
    )
  end
end
