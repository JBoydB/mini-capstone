class CartedProductsController < ApplicationController

  def index
    if current_user && current_user.carted_products.where(status: "carted").any?
      @cart = current_user.carted_products.where(status: "carted")
      render "cart.html.erb"
    else
      flash[:warning] = "Add items to your cart first"
      redirect_to "/products"
    end
  end

  def create
    product_id = params[:product_id]
    cart_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: product_id,
      quantity: params[:quantity],
      status: "carted"
      )
    cart_product.save
    redirect_to "/cart"
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product Removed"
    redirect_to "/cart"
  end
end
