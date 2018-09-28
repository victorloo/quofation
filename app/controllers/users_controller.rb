class UsersController < ApplicationController
  before_action :set_user

  def show
    redirect_to user_path(current_user), notice:"請不要去別人的頁面！" if @user.id != current_user.id

    @orders = @user.orders.order(created_at: :desc)
    @chatrooms = @user.chat_rooms.order(created_at: :desc)
    @des_chars = current_user.designer.chat_rooms.order(created_at: :desc) if current_user.role == "designer"
  end

  def edit
    redirect_to user_path(current_user), notice:"請不要去別人的頁面！" if @user.id != current_user.id

    @orders = @user.orders
    @chatrooms = @user.chat_rooms
    @des_chars = current_user.designer.chat_rooms if current_user.role == "designer"
  end

  def update
    redirect_to user_path(@user) if @user.update(user_params)
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :realname, :phone, :avatar, :zip, :city, :dist, :address)
  end
  
end
