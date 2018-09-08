class ThirtydaysController < ApplicationController
  
  def index
    @products = Product.all.sample(3)
  end
  
end
