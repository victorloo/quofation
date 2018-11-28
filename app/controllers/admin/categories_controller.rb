class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_designer, only: [:index, :create, :update]
  before_action :set_category, only: [:update]


  def index
    @categories = Category.all
    if params[:id]
      set_category
    else
      @category = Category.new
    end
  end

  def create
   @category = Category.new(category_params)
   if @category.save
     flash[:notice] = "category was successfully created"
     redirect_to admin_designer_path(params[:designer_id])
   else
     @categories = Category.all
     render :index
   end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "category was successfully updated"
      redirect_to admin_designer_path(params[:designer_id])
    else
      @categories = Category.all
      render :index
    end
  end

  
  private

  def set_designer
    @designer = Designer.find(params[:designer_id])
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end



