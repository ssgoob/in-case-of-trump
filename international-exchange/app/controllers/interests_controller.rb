class InterestsController < ApplicationController

  def new
    @interests = Interest.all
    @user_interest = UserInterest.new
  end

  def create
  end




end