class OrdersController < ApplicationController
  def new
    @product = Product.find_by(id: params[:product_id])
    render :new
  end

  def create
    @product = Product.find_by(id: params[:product_id])
    if current_user
      product_id = params[:product_id]
      order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity]
        )
      order.subtotal = @product.price * order.quantity.to_i
      order.tax = order.subtotal * 0.09
      order.total = order.tax + order.subtotal
      order.save
      redirect_to "/products/#{@product.id}/orders/#{order.id}"
    else
      flash[:warning] = "You must Login to Order!"
      redirect_to "/login"
    end
  end

  def show
    @product = Product.find_by(id: params[:product_id])
    @order = Order.find(params[:id])
    render :show
  end
end

