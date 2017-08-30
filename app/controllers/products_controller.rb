class ProductsController < ApplicationController
  
  def all_products
    @all_products = Product.all
    render "allproducts.html.erb"
  end

  def tv
    @tv = Product.find_by(id: 1)
    render "tv.html.erb"
  end

  def console
    @console = Product.find_by(id: 2)
    render "console.html.erb"
  end

  def remote
    @remote = Product.find_by(id: 3)
    render "remote.html.erb"
  end

  def paper
    @paper = Product.find_by(id: 4)
    render "paper.html.erb"
  end
end
