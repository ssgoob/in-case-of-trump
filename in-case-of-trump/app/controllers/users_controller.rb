class UsersController < ApplicationController
  
  def index 
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if(@user.save)
        if (params[:user][:status]=='Citizen')
          citizen = Citizen.new
          citizen.user = @user
          citizen.save
          #make citizen and assign this user to citizen
        else
          international = International.new
          international.user = @user
          international.save
          #make international and assign this user to international
        end
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params) ? (redirect_to @user) : (render :edit)
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :gender, :dob, :preference, :location, :preference, :interests, :photos, :status)
  end


end
