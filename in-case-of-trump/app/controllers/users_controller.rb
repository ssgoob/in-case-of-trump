class UsersController < ApplicationController
  # before_action :authenticate_user!, :user_signed_in?, :current_user, :user_session


  def index 
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)

    if(@user.save)
        if(params[:status]=='Citizen')
          #make citizen and assign this user to citizen
        else
          #make international and assign this user to international
        end
      redirect @user
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
  end




  private

  def user_params
    params.require(:user).permit(:name, :gender, :dob, :preference)
  end


end
