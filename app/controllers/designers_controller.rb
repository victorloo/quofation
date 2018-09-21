class DesignersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @designers = Designer.page(params[:page]).per(8)
  end

  def show
    @designers = Designer.find(params[:id])
    @designer = Designer.find(params[:id])
    @products = Product.page(params[:page]).per(6)
  end
end
