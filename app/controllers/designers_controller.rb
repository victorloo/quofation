class DesignersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @designers = Designer.page(params[:page]).per(8)
  end

  def show
    @designer = Designer.find(params[:id])
    @products = @designer.products.page(params[:page]).per(6)
  end
end
