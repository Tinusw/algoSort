class UsersController < ApplicationController

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
  end

  private

  def user_params
    params.require(:user).permit(:name, :q1, :q2, :q3, :q4, :q5)
  end

end
