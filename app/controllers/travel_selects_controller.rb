class TravelSelectsController < ApplicationController
  def new
    @travel_select = TravelSelect.new
  end
end
