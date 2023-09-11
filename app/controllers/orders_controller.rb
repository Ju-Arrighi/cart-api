class OrdersController < ApplicationController
  before_action :set_cart, only: %i[index show create update destroy]
  before_action :set_order, only: %i[show]
  # GET/cart/:cart_id/orders
  def index
    @orders = @cart.orders

    render json: @orders
  end

  # GET /carts/:cart_id/orders/:id
  def show
    render json: @order
  end

  # POST /carts/:cart_id/orders
  def create
    @order = Order.new(order_params)
    if check_cart_items
      @error_message = { error: 'You already have this item in your cart. Please update quantity!' }
      render json: @error_message, status: 500
    else
      check_stock
      @order.subtotal = subtotal_calculator
      @cart.orders << @order
      @cart.save
      render json: @cart.orders, status: :created
    end
  end

  # PATCH	/carts/:cart_id/orders/:id
  def update
    binding.break
    @order = Order.find(order_params[:id])
    unit = order_params[:quantity]
    check_stock
    if unit.zero?
      @order.destroy
    elsif @order.update(order_params)
      @order.subtotal = subtotal_calculator
      @order.save
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

  def set_cart
    @cart = Cart.find(params[:cart_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    # params.require(:order).permit(
    #   :id, :cart_id, :product_id, :quantity,
    #   products_attributes: [:name, :product_type]
    # )
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  def subtotal_calculator
    @order.quantity * Product.find(@order[:product_id]).price
  end

  def check_stock
    product = Product.find(@order[:product_id])
    stock = product.stock
    wish = order_params[:quantity]
    if product.stock < wish && (stock - wish).positive?
      product[:stock] = stock - wish
      product.save
    elsif product.stock > wish
      product[:stock] = stock + (@order.quantity - wish)
      product.save
    else
      render json: @cart.orders.errors
    end
  end

  def check_cart_items
    cart_itens.include?(order_params[:product_id])
  end

  def cart_itens
    product_array = []
    cart_orders = @cart.orders
    cart_orders.each do |order|
      product_array << order.product_id
    end
    product_array
  end
end
