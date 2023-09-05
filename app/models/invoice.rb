class Invoice < ApplicationRecord
  has_one :cart
  has_many :orders, through: :cart

  def invoice_generator
    total = 0
    cart_itens.each do |item|
      item_turn = Product.find(item)
      @invoice = Invoice.new(
        @invoice.item_name = item_turn.product_name,
        @invoice.item_type = item_turn.product_type,
        @invoice.unit = item_turn.quantity,
        @invoice.unit_price = item_turn.price,
        @invoice.subtotal = @invoice.unit * @invoice.unit_price
      )
      @invoice.save
      total += @invoice.subtotal
      # binding.break
    end
    @invoice.total = total
  end

   def cart_itens
    cart_orders = @invoice.cart.orders
    cart_orders.each do |order|
      product_array << order.product_id
    end
    product_array
  end
end
