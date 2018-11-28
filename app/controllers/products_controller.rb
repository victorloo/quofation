class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :add_to_cart, :remove_from_cart, :adjust_item]
  
  def index
    @category = []
    Category.all.each do |cc|
      @category.push(cc)  if cc.products.size > 0
    end
  end

  def show
    @comment = Comment.new
    @cart_item = CartItem.new
    @products = Product.all.sample(6)
    @designer_products = @product.designer.products.sample(6)
    @category_products = @product.category.products.sample(6)
  end

  def category
    @category = Category.find(params[:id])
    @products = @category.products.order("RANDOM()")
  end
  
  def add_to_cart
    current_cart.add_cart_item(@product)
    flash[:notice] = "Successfully add to cart!"
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    cart_item.destroy
    @product.update(
      add_to_cart_count: @product.add_to_cart_count -= 1
    )
    flash[:notice] = "Successfully remove from cart!"
    redirect_back(fallback_location: root_path)
  end

   def adjust_item
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    if params[:type] == "add"
      cart_item.quantity += 1
    elsif params[:type] == "substract"
      cart_item.quantity -= 1
    end
     if cart_item.quantity == 0
      cart_item.destroy
    else
      cart_item.save
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
  
end
