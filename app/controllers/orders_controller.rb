class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    subtotal = 0

    @cart = current_user.carted_products.where(status: "carted")
    @cart.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
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
    if current_user.id == user_id:
      render "show.html.erb"
    else
      flash[:warning] = "You are not authorized to view this page"
      redirect_to products
    end
  end

end