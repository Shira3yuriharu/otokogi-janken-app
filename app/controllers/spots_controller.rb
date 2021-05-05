class SpotsController < ApplicationController

  before_action :search_product, only: [:index, :search]

  def index
    @spots = Spot.all
  end

  def search
    @results = @p.result.includes(:category)
  end

  private
  def search_spot
    @p = Spot.ransack(params[:q])
  end

end
