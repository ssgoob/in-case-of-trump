class UsersController < ApplicationController
  
  def index 
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :dob, :location, :preference)
  end


end
