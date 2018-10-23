class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9)
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @cart_item = CartItem.new
    @products = Product.all.sample(6)
    @designer_products = @product.designer.products.sample(6)
    @category_products = @product.category.products.sample(6)
  end
  
  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product)

    flash[:notice] = "加入購物車成功！"
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    @product = Product.find(params[:id])
    cart_item = current_cart.cart_items.find_by(product_id: @product)
    cart_item.destroy
    @product.update(
      add_to_cart_count: @product.add_to_cart_count -= 1
    )

    flash[:notice] = "移除商品成功！"
    redirect_back(fallback_location: root_path)
  end

   def adjust_item
    @product = Product.find(params[:id])
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
end
