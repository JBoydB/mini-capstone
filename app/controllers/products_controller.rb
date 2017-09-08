class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    render "show.html.erb"
  end

  def index
    @all_products = Product.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    new_product = Product.new(
      product_name: params[:product_name],
      price: params[:price],
      desc: params[:desc],
      image: params[:image]
      )
    new_product.save
    flash[:success] = "Product successfully added!"
    redirect_to "/products/#{new_product.id}"
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      product_name: params[:product_name],
      price: params[:price],
      desc: params[:desc],
      image: params[:image]
      )
    flash[:success] = "Product has been updated!"
    redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find(params[:id])
    render "edit.html.erb"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product removed."
    redirect_to "/products"
  end
end
