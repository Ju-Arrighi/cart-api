class OrdersController < ApplicationController
  before_action :set_cart, only: %i[index show create update destroy]
  before_action :set_order, only: %i[show]
  # GET/cart/:cart_id/orders
  def index
    @orders = set_cart.orders

    render json: @orders
  end

  # GET /carts/:cart_id/orders/:id
  def show
    render json: @order
  end

  # POST /carts/:cart_id/orders
  def create
    # verify_orders
    # cart_orders = @cart.orders
    @order = Order.new(order_params)
    @order.subtotal = subtotal_calculator
    @cart.orders << @order
    if @cart.save
      render json: @cart.orders, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH	/carts/:cart_id/orders/:id
  def update
    @order = Order.find(order_params[:id])
    if @order.update(order_params)
      @order.subtotal = subtotal_calculator
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

  def subtotal_calculator
    @order.quantity * Product.find(@order[:product_id]).price
  end

  private

  def set_cart
    @cart = Cart.find(params[:cart_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(
      :id, :cart_id, :product_id, :quantity
    )
  end
end
