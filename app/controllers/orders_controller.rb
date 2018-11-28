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
        redirect_to order_path(@order), notice: "new order created"
      else
        @items = current_cart.cart_items
        render "carts/show"
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.payment_status == 'not_paid' && @order.order_items.where(shipping_status: "not_shipped").size > 0
      orderItems = @order.order_items.map{|x| x.product_id}
      @chatRoom
      orderItems.each do |itemId|
        if (ChatRoom.all.where(user_id: current_user.id, product_id: itemId).length > 0)
          @chatRoom = ChatRoom.all.where(user_id: current_user.id, product_id: itemId).first
        end
      end

       @order.order_items.each do |item|
        if (Inventory.all.where(product_id: item.product_id, color_name: item.color_name, size_name: item.size_name).length > 0)
          @inventory = Inventory.all.where(product_id: item.product_id, color_name: item.color_name, size_name: item.size_name).first
          @inventory.update!(
            amount: @inventory.amount+1
          )
        end
      end
      
       @chatRoom.destroy
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
      if Payment.all.empty?
        rand_id = 1 + rand(999)
      else
        rand_id = Payment.last.id + 1 +rand(999)
      end
      @payment = Payment.create!(
        sn: Time.now.to_i,
        order_id: @order.id,
        payment_method: params[:payment_method],
        amount: @order.amount,
        rand_id: rand_id
      )

      render layout: false
    end
  end

  private
   
  def order_params
    params.require(:order).permit(:name, :phone, :address, :payment_method)
  end

end