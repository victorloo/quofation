class BrandsController < ApplicationController
  def index
    @brands = Brand.all.sample(5)
  end

end
