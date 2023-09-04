class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show update destroy ]
  # GET/carts/:cart_id/invoice/:id
  def show
    render json: @invoice # include: [:orders]
  end

  private

  def set_invoice
    @cart = Cart.find(params[:cart_id])
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
end
