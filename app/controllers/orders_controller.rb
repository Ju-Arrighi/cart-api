class OrdersController < ApplicationController
  # GET/cart/:cart_id/orders
  def show
    render json: @orders #include: [:phones, :kind, :address]
  end
end
