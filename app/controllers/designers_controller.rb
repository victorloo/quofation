class DesignersController < ApplicationController

  def index
    @designers = Designer.all
  end
end
