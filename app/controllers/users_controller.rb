class UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def show
    @user = User.friendly.find(params[:id])
    @orders = @user.orders

  end


end
