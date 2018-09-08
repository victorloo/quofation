class ThirtydaysController < ApplicationController
  
  def index
    @products = Product.all.sample(3)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end
