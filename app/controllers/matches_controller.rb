class MatchesController < ApplicationController
  def index
    @places = Place.all
    @users = User.all
  end

  private

end
