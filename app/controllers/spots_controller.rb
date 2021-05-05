class SpotsController < ApplicationController

  before_action :search_spot, only: [:index, :search]

  def index
    @spots = Spot.all
    set_category_column
  end

  def search
    @results = @p.result.includes(:category)
  end

  private
  def search_spot
    @p = Spot.ransack(params[:q])
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end

end
