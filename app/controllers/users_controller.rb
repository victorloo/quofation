class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to user_path(current_user), notice:"請不要去別人的頁面！" if @user.id != current_user.id

    @orders = @user.orders.order(created_at: :desc).limit(3)
    @chatrooms = @user.chat_rooms.order(created_at: :desc).limit(3)
    @des_chars = current_user.designer.chat_rooms if current_user.role == "designer"
  end
end
