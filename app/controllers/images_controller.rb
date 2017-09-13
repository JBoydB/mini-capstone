class ImagesController < ApplicationController

  def show
    @image = Image.find(params[:id])
    render "show.html.erb"
  end

  def index
    @all_images = Image.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    new_image = Image.new(
      url: params[:url],
      product_id: params[:product_id]
      )
    new_image.save
    flash[:success] = "Image successfully added!"
    redirect_to "/images/#{new_image.id}"
  end

  def update
    @image = Image.find(params[:id])
    @image.update(
      url: params[:url],
      product_id: params[:product_id]
      )
    flash[:success] = "Image has been updated!"
    redirect_to "/images/#{@image.id}"
  end

  def edit
    @image = Image.find(params[:id])
    render "edit.html.erb"
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:success] = "Image removed."
    redirect_to "/images"
  end
end

