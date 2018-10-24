class Admin::OrdersController < ApplicationController
  before_action :set_order, except: [:index, :update_order_item]
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
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
        #UserMailer.notify_order_shipped(@order_item.order).deliver_now
      end
      redirect_to admin_order_path(@order_item.order), notice: "Order Item updated"
    else
      flash.now[:alert] = @order_item.errors.full_messages.to_sentence
      redirect_to admin_order_path(@order_item.order), alert: "There are some errors."
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
