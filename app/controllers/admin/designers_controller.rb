class Admin::DesignersController < ApplicationController
  def index
    @designers = Designer.all
  end

  def new
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(designer_params)
    if @designer.save
      flash[:notice] = "成功新增設計師"
      redirect_to admin_designers_path
    else
      flash.now[:alert] = "新增設計師失敗"
      render :new
    end    
  end

  private

  def designer_params
    params.require(:designer).permit(:name, :brandname, :description, :image)
  end
end
