class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin


  def index
    @designer = Designer.find(params[:designer_id])
    @categories = Category.all
  end


end
