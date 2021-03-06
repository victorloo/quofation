class ChatRoomsController < ApplicationController

  def index
    @user = current_user
    @orders = @user.orders.order(created_at: :desc)
    @chatrooms = @user.chat_rooms.order(created_at: :desc)
    @des_chars = current_user.designer.chat_rooms.order(created_at: :desc) if current_user.designer?
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    if @chat_room.user != current_user && @chat_room.product.designer.user != current_user
      redirect_to user_chat_rooms_path(current_user), alert: "Maybe you go to wrong chat room"
    end
    @message = Message.new
  end

  def designer
    @user = current_user
    @orders = @user.orders.order(created_at: :desc)
    @chatrooms = @user.chat_rooms.order(created_at: :desc)
    @des_chars = current_user.designer.chat_rooms.order(created_at: :desc) if current_user.designer?
  end
  
  def new
    @chat_room = ChatRoom.new
  end

  def create
    @fitting_photo = FittingPhoto.find(params[:id])
    @chat_room = @fitting_photo.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  private
  
  def chat_room_params
    params.require(:chat_room).permit(:title)
  end

end