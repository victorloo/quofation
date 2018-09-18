class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin


  def index
    @designer = Designer.find(params[:designer_id])
    @categories = Category.all
    @category = Category.new
  end

  def create
   @designer = Designer.find(params[:designer_id])
   @category = Category.new(category_params)
   if @category.save
     flash[:notice] = "category was successfully created"
     redirect_to admin_designer_path(params[:designer_id])
   else
     @categories = Category.all
     render :index
   end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end



