class Admin::ChatRoomsController < ApplicationController
  def index
    @chatrooms = ChatRoom.all
  end
end