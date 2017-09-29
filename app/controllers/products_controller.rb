class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def show
    @product = Product.find(params[:id])
    render "show.html.erb"
    @images = @product.images
  end

  def index
    @all_products = Product.all
    sorting = params[:sort_by]
    if sorting
      @all_products = Product.all.order(sorting)
    end
    des_sorting = params[:des_sort_by]
    if des_sorting
      @all_products = Product.all.order(des_sorting => 'desc')
    end
    render "index.html.erb"
  end

  def new
      @product = Product.new
      render "new.html.erb"
  end

  def create
    new_product = Product.new(
      product_name: params[:product_name],
      price: params[:price],
      desc: params[:desc],
      )
    if new_product.save
      flash[:success] = "Product successfully added!"
      redirect_to "/products/#{new_product.id}"
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
      @product.update(
          product_name: params[:product_name],
          price: params[:price],
          desc: params[:desc],
          )
      @product.product_name = params[:product_name]
      @product.price = params[:price]
      @product.desc = params[:desc]
      if @product.save
        redirect_to "/products/#{@product.id}"
      else
        render :edit
      end

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
