class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show update destroy ]

  # GET/carts/:cart_id/invoice/:id
  def show
    # render json: @invoice.orders # include: [:order]
    render json: {
      invoice: @invoice, products: @products, subtotal: @subtotal, total: @total
    }
  end

  private

  def set_invoice
    if params[:cart_id]
      invoice_id = Cart.find(params[:cart_id]).invoice_id
    else
      invoice_id = Invoice.find(params[:id]).id
    end
    @invoice = Invoice.find(invoice_id)
  end

  # Only allow a list of trusted parameters through.
  def invoice_params
    params.require(:invoice).permit(
      :cart_id_id,
      cart_attributes: [:order_id, :_destroy]
    )
  end

  def cart_itens
    cart_orders = @invoice.cart.orders
    cart_orders.each do |order|
      product_array << order.product_id
    end
    product_array
  end

  def invoice_creator # Fazer um map para gerar o json
    total = 0
    cart_itens.each do |item|
      item_turn = Product.find(item)
      @invoice = {
        @invoice.item_name = item_turn.product_name
        @invoice.item_type = item_turn.product_type
        @invoice.unit = item_turn.quantity
        @invoice.unit_price = item_turn.price
        @invoice.subtotal = @invoice.unit * @invoice.unit_price
      }
      @invoice.save
      total += @invoice.subtotal
      # binding.break
    end
    @invoice.total = total
  end
end


  # def invoice_generator
  #   total = 0
  #   cart_itens.each do |item|
  #     item_turn = Product.find(item)
  #     @invoice = Invoice.new(
  #       @invoice.item_name = item_turn.product_name,
  #       @invoice.item_type = item_turn.product_type,
  #       @invoice.unit = item_turn.quantity,
  #       @invoice.unit_price = item_turn.price,
  #       @invoice.subtotal = @invoice.unit * @invoice.unit_price
  #     )
  #     @invoice.save
  #     total += @invoice.subtotal
  #     # binding.break
  #   end
  #   @invoice.total = total
  # end


#   def show
#     # Calculate the subtotal and total based on your business logic.
#     @subtotal = @products.sum { |product| product.price * product.quantity }
#     @total = @subtotal # Customize this based on your requirements.

#     render json: { invoice: @invoice, products: @products, subtotal: @subtotal, total: @total }
#   end
