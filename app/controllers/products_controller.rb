class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9)
  end

  def show
    @products = Product.all.sample(3)
  end
  
end
