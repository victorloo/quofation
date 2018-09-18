class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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

  def edit
    @designer = Designer.find(params[:designer_id])
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.designer_id = params[:designer_id]
    if @product.save
      flash[:notice] = "Product was successfully created"
      redirect_to admin_designer_path(params[:designer_id])
    else
      flash.now[:alert] = "Product was failed to create"
      render :new
    end
  end

  def update
    @designer = Designer.find(params[:designer_id])
    @product = Product.find(params[:id])
    if @product.update(product_params) 
      flash[:notice] = "product was successfully updated"
      redirect_to admin_designer_path(params[:designer_id])
    else
      flash.now[:alert] = "product was failed to update"
      render :edit
    end
  end

  def destroy
    @designer = Designer.find(params[:designer_id])
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_designer_path(params[:designer_id]) 
    flash[:alert] = "product was deleted"
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :category_id, :size_id, :color_id, photos_attributes: [:image])
  end

  def set_product
    @designer = Designer.find(params[:designer_id])
    @products = Product.find(params[:id])
  end

end
