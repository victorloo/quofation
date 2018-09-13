class Admin::ProductsController < ApplicationController
  
  def index
    @designer = Designer.find(params[:designer_id])
    @products = @designer.products
  end

  def show
    @designer = Designer.find(params[:designer_id])
    @product = Product.find(params[:id])
  end

  def new
    @designer = Designer.find(params[:designer_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.designer_id = params[:designer_id]
    if @product.save
      flash[:notice] = "Product was successfully created"
      redirect_to admin_designer_products_path
    else
      flash.now[:alert] = "Product was failed to create"
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def set_product
    @products = Product.find(params[:id])
  end

end
