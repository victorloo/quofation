class FittingphotosController < ApplicationController
  
  def index
    @product = Product.find(params[:thirtyday_id])
    @photos = @product.fitting_photos
  end

end
