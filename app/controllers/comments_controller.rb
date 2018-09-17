class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:thirtyday_id])
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to thirtyday_path(id: @product.id)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
end