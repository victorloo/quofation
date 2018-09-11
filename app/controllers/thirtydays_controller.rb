class ThirtydaysController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all.sample(3)
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def designers
    @designers = User.where(role: :designer)
  end

  def products
    @products = Product.all
  end
  
end
