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
    @new_product = Product.new(
      product_name: params[:product_name],
      price: params[:price],
      desc: params[:desc],
      image: params[:image]
      )
    @new_product.save
    render "create.html.erb"
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      product_name: params[:product_name],
      price: params[:price],
      desc: params[:desc],
      image: params[:image]
      )
    render "update.html.erb"
  end

  def edit
    @product = Product.find(params[:id])
    render "edit.html.erb"
  end
end
