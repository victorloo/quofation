class DesignersController < ApplicationController

  def index
    @designers = Designer.page(params[:page]).per(9)
  end

  def show
    @designers = Designer.find(params[:id])
    @products = Product.page(params[:page]).per(6)
  end
end
