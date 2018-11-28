class Admin::OrdersController < ApplicationController
  before_action :set_order, except: [:index, :update_order_item]

  def index
    if current_user.admin?
      @orders = Order.all  
    elsif current_user.designer?
      @designer = current_user.designer
      @products = @designer.products
      @orders = []
      @products.each do |product|
        if product.orders.size > 0 
          product.orders.each do |order|
            @orders.push(order)    
          end
        end
      end
    end
  end

  def show
    if current_user.designer?
      item_leng = []
      @order.order_items.each do |item|
        item_leng.push(item) if item.product.designer.user == current_user
      end
      redirect_to admin_orders_path, notice: "Maybe you go to wrong order" if item_leng.size < 1
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      if @order.payment_status == "paid"
        #UserMailer.notify_order_paid(@order).deliver_now
      end
      redirect_to admin_orders_path, notice: "Order updated"
    else
      flash.now[:alert] = @order.errors.full_messages.to_sentence
      render "admin/orders/edit"
    end
  end

  def update_order_item
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      if @order_item.shipping_status == "shipped"
        @order_item.order.update(shipping_count: @order_item.order.shipping_count += 1)
        #UserMailer.notify_order_shipped(@order_item.order).deliver_now
      elsif @order_item.shipping_status == "not_shipped"
        @order_item.order.update(shipping_count: @order_item.order.shipping_count -= 1)
      end
      redirect_to admin_order_path(@order_item.order), notice: "Order Item updated"
    else
      flash.now[:alert] = @order_item.errors.full_messages.to_sentence
      redirect_to admin_order_path(@order_item.order), alert: "There are some errors."
    end
  end

  def destroy
    if @order.payment_status == 'paid'
      redirect_to admin_orders_path, alert: "The Order has be paid"
    else
      @order.destroy
      redirect_to admin_orders_path, alert: "Order was deleted"
    end
  end
   
  private

  def order_params
    params.require(:order).permit(:payment_status)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:shipping_status)
  end

end
