class CartsController < ApplicationController
  def index
    @carts = Cart.all

    render json: @carts, include: [:orders]
  end
end
