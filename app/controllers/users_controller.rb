class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @places = Place.all
  end

  def new
    @user ||= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @places = Place.all.sort_by { |place| @user.euclidean_distance_to_user_to_places(place) }

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :q1, :q2, :q3, :q4, :q5)
  end

end
