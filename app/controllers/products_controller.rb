class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9)
  end

  def show
    @products = Product.find(params[:id])
  end
  
end
