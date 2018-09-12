class DiscussionsController < ApplicationController
  
  def create
    @photo = FittingPhoto.find(params[:fittingphoto_id])
    @discussion = @photo.discussions.build(discussion_params)
    @discussion.user = current_user
    @discussion.save!
    redirect_to thirtyday_fittingphoto_path(thirtyday_id: @photo.product, id: @photo)
  end
  
  private

  def discussion_params
    params.require(:discussion).permit(:content)
  end

end
