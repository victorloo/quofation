class ThirtydaysController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.where(thirtydays_status: true).sample(3)
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def designers
    @designers = Designer.order("RANDOM()")
  end

  def products
    @products = Product.where(thirtydays_status: true).order("RANDOM()")
  end
  
end
