class CommentsController < ApplicationController

  def create
    if params[:product_id].present?
      @product = Product.find(params[:product_id])
    elsif params[:thirtyday_id].present?
      @product = Product.find(params[:thirtyday_id])
    end
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    if params[:product_id].present?
      redirect_to designer_product_path(designer_id: @product.designer, id: @product.id)
    elsif params[:thirtyday_id].present?
      redirect_to thirtyday_path(id: @product.id)  
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content, :privacy)
  end
  
end