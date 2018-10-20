class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :checkout_spgateway
  
  def index
    @user = current_user
    @orders = @user.orders.order(created_at: :desc)
    @chatrooms = @user.chat_rooms
    @des_chars = current_user.designer.chat_rooms if current_user.role == "designer"
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    if current_user.nil?
      # store order data in session so we can retrieve it later
      session[:new_order_data] = params[:order]
      # redirect to devise login page
      redirect_to new_user_session_path
    else
      @order = current_user.orders.new(order_params)
      @order.sn = Time.now.to_i
      @order.add_order_items(current_cart)
      @order.amount = current_cart.subtotal

      if @order.save
        current_cart.cart_items.each do |item|
          item.inventory.update!(
            amount: item.inventory.amount-1
          )
        end
        current_cart.destroy
        session.delete(:new_order_data)

        # Create ChatRooms
        @order.products.each do |product|
          if product.thirtydays_status
            product.chat_rooms.create!(
              title: "#{product.name} and #{current_user.name}",
              product_id: product.id,
              user_id: current_user.id
            )
          end
        end

        #UserMailer.notify_order_create(@order).deliver_now!
        redirect_to orders_path, notice: "new order created"
      else
        @items = current_cart.cart_items
        render "carts/show"
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.shipping_status == "not_shipped"
      
      @order.destroy
      redirect_to orders_path, alert: "order##{@order.sn} cancelled."
    end
  end

  def checkout_spgateway
    @order = current_user.orders.find(params[:id])
    if @order.payment_status != "not_paid"
      flash[:alert] = "Order has been paid."
      redirect_to orders_path
    else
      @payment = Payment.create!(
        sn: Time.now.to_i,
        order_id: @order.id,
        payment_method: params[:payment_method],
        amount: @order.amount
      )

      render layout: false
    end
  end


  private
   
  def order_params
    params.require(:order).permit(:name, :phone, :address, :payment_method)
  end

end
