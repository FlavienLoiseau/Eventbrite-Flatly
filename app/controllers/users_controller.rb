class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def check_user
    @user = User.find(params[:id])
    if current_user.id =! @user.id
      redirect_to user_path(current_user.id)
    end
  end

  def show
    check_user
    @user = User.find(params[:id])
    @events = Event.where(admin: @user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

end
