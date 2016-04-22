class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_param)
    if @product.save
      redirect_to product_url(@product)
    else
      render "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if  @product.update(product_param)
      redirect_to product_url
    else
      render :edit
    end
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
   redirect_to :index
  end

private
  def product_param
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
