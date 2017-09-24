class OrdersController < ApplicationController

  def create
    subtotal = 0
    if current_user
      @cart = current_user.carted_products.where(status: "carted")
      @cart.each do |carted_product|
        subtotal += carted_product.product.price * carted_product.quantity
      end
    else
      flash[:warning] = "You must be logged in"
      redirect_to "/login"
    end
    tax = subtotal * 0.09
    total = subtotal + tax
      order = Order.new(
      user_id: @current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
      )
    order.save
    @cart.update(status: "Purchased", order_id: order.id)
    redirect_to "/orders/#{order.id}"
  end

  def show
  render "show.html.erb"  
  end

end