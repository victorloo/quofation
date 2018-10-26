class CartItemsController < ApplicationController
  def create
    @cart_item = current_cart.cart_items.build(cart_item_params)
    @size = Size.find(cart_item_params[:size_name])
    @cart_item.size_name = @size.name
    @invnetory = Inventory.where(color_id: cart_item_params[:color_id], size_id: @size.id, product_id: cart_item_params[:product_id]).first
    @cart_item.inventory_id = @invnetory.id
    if @cart_item.save
      @cart_item.product.update(
        add_to_cart_count: @cart_item.product.add_to_cart_count += 1
      )
      flash[:notice] = "Product was successfully added to cart."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Oops, there are some error."
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @item = CartItem.find(params[:id])
    if @item.update(cart_item_params)
      flash[:notice] = "You choose another qunatity"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity, :size_name, :color_id, :color_name, :inventory_id)
  end
end
