class OrdersController < ApplicationController
  before_action :set_order, only: %i[index show create update destroy]
  # GET/cart/:cart_id/orders
  def index
    @orders = Order.all

    render json: @orders # include: [:products]
  end

  # GET /carts/:cart_id/orders/:id
  def show
    render json: @order
  end

  # POST /carts/:cart_id/orders
  def create
    # verify_orders
    # cart_orders = @cart.orders
    @cart.orders << Order.new(order_params)
    if @cart.save
      render json: @cart.orders, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH	/carts/:cart_id/orders/:id
  def update
    order = Order.find(order_params[:id])
    if order.update(order_params)
      render json: @cart.orders
    else
      render json: @cart.orders.errors
    end
  end

  # DELETE	/carts/:cart_id/orders/:id
  def destroy
    order = Order.find(order_params[:id])
    order.destroy
    render json: @cart.orders
  end

  private

  def set_order
    @cart = Cart.find(params[:cart_id])

  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(
      :id, :cart_id, :product_id, :quantity,
      product_attributes: [:product_type, :product_name, :_destroy]
    )
  end
end
