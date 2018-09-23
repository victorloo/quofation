class Admin::DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update, :destroy]

  def index
    @designers = Designer.page(params[:page]).per(10)
  end

  def new
    @designer = Designer.new
  end
  
  def create
    @designer = Designer.new(designer_params)
    @user = @designer.user
    if @designer.save
      @user.role = "designer"
      @user.save!
      flash[:notice] = "成功新增設計師"
      redirect_to admin_designers_path
    else
      flash.now[:alert] = "新增設計師失敗"
      render :new
    end
  end

  def show
    #原程式碼命名為set_designer
    @designers = Designer.find(params[:id])
    @designer = Designer.find(params[:id])
    @products = Product.page(params[:page]).per(10)
  end

  def edit
    
  end

  def update
    if @designer.update(designer_params)
      flash[:notice] = "設計師修改成功"
      redirect_to admin_designers_path
    else
      flash.now[:alert] = "設計師修改失敗"
      render :edit
    end
  end

  def destroy
    @designer.destroy
    redirect_to admin_designers_path
    flash[:alert] = "設計師已刪除"
  end

  private

  def designer_params
    params.require(:designer).permit(:name, :brandname, :description, :image, :user_id, )
  end

  def set_designer
    @designer = Designer.find(params[:id])
  end
end
