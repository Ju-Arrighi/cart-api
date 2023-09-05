class ProductsController < ApplicationController
  # GET	/products (See all products)
  def index
    @products = Product.all

    render json: @products
  end
end
