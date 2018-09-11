class FittingphotoesController < ApplicationController
  
  def index
    @product = Product.find(params[:thirtyday_id])
    @photoes = @product.fitting_photoes
  end

end
