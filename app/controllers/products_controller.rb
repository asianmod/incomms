class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])  
  end

  def index
    @products = Product.all 
  end

  def create
    @product_params = params.require(:product)
                            .permit(:name, :item_desc, :price)
    @product = Product.create(@product_params)
    redirect_to product_path(id: @product.id)
  end
end