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
      flash[:notice] = "Create Designer successfully"
      redirect_to admin_designers_path
    else
      flash.now[:alert] = "Fail to create designer"
      render :new
    end
  end

  def show
    #原程式碼命名為set_designer
    @products = @designer.products.page(params[:page]).per(10)
  end

  def edit
  end

  def update
    if @designer.update(designer_params)
      flash[:notice] = "Update designer successfully"
      redirect_to admin_designers_path
    else
      flash[:alert] = "Delete designer successfully"
      render :edit
    end
  end

  def destroy
    @designer.destroy
    redirect_to admin_designers_path
    flash[:alert] = "Delete designer successfully"
  end

  private

  def designer_params
    params.require(:designer).permit(:name, :brandname, :description, :image, :user_id, )
  end

  def set_designer
    if current_user.designer?
      @designer = current_user.designer
    else
      @designer = Designer.find(params[:id])
    end
  end
end
