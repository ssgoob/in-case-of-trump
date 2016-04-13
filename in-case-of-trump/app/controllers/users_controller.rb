class UsersController < ApplicationController
  
  def index 
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params, dob: date_params)
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

# 1. If @user == current_user, show my page
# 2. If @user is in current_users's matches, let me match see their page
# 3. If @suer is not in current_user's matches, keep me at index

  def show
    @user = User.find(params[:id])
    if Match.match_exist(@user, current_user)
      @radius = 500
      @recs = LocationClient.new(@user.latitude, @user.longitude, @radius).create_recommendations
      while @recs.empty? 
        @radius *= 2
        @recs = LocationClient.new(@user.latitude, @user.longitude, @radius).create_recommendations
      end
    end
    redirect_to matches_path unless (current_user.has_access?(@user))
    # unless(current_user == @user || current_user.all_matches.include?(@user))
    #   redirect_to matches_path
    # end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) && @user.update(dob: date_params)
      redirect_to @user
    else
      render :edit
    end  
  end

  def add_user_interests
    current_user.interests.clear
    interests_array = params[:user][:interest_ids]
    interests_array.pop
    interests_array.each do |interest|
      new_interest = Interest.find(interest)
      current_user.interests << new_interest
    end
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :gender, :dob, :preference, :location, :preference, :interests, :photos, :status)
  end

  def date_params
    date = Date.new params[:user]["dob(1i)"].to_i, params[:user]["dob(2i)"].to_i, params[:user]["dob(3i)"].to_i
  end

  

end
