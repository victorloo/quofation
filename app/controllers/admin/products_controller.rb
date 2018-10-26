class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_designer, except: :index

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @cart_item = CartItem.new
    @admin_product = true
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.designer_id = params[:designer_id]
    if @product.save
      automatically_add_attributes
      flash[:notice] = "Product was successfully created"
      redirect_to admin_designer_path(params[:designer_id])
    else
      flash.now[:alert] = "Product was failed to create"
      render :new
    end
  end

  def update
    if @product.update(product_params)
      automatically_add_attributes
      flash[:notice] = "product was successfully updated"
      redirect_to admin_designer_path(params[:designer_id])
    else
      flash.now[:alert] = "product was failed to update"
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_designer_path(params[:designer_id]) 
    flash[:alert] = "product was deleted"
  end


  private

  def product_params
    params.require(:product).permit(
      :name, :price, :description, :image, :category_id, :thirtydays_status, photos_attributes: [:image],
      inventories_attributes: [:id, :amount, :product_id, :color_id, :size_id, :_destroy])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_designer
    @designer = Designer.find(params[:designer_id])
  end

  def automatically_add_attributes
    @product.inventories.each do |inventory|
      inventory.update!(
        color_name: inventory.color.name,
        size_name: inventory.size.name
      )
    end
  end

end
