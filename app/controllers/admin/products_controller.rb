class Admin::ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def show
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def set_product
    @products = Product.find(params[:id])
  end

end
