class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to user_path(current_user), notice:"請不要去別人的頁面！" if @user.id != current_user.id

    @orders = @user.orders.order(created_at: :desc)
    @chatrooms = @user.chat_rooms.order(created_at: :desc)
    @des_chars = current_user.designer.chat_rooms.order(created_at: :desc) if current_user.role == "designer"
  end
end
