class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @products = Product.page(params[:page]).per(9)
  end
  
end
