class ThirtydaysController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.where(thirtydays_status: true).sample(3)
    @rand_prod = Product.where(thirtydays_status: true).sample
  end
  
  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @cart_item = CartItem.new
    @products = Product.where(thirtydays_status: true).sample(6)
    @designer_products = @product.designer.products.sample(6)
    @category_products = @product.category.products.sample(6)
  end

  def designers
    @products = Product.where(thirtydays_status: true).order("RANDOM()")
  end

  def products
    @products = Product.where(thirtydays_status: true).order("RANDOM()")
  end
  
end
