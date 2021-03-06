class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
