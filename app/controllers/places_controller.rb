class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place ||= Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def place_params
    params.require(:place).permit(:name, :q1, :q2, :q3, :q4, :q5)
  end

end
