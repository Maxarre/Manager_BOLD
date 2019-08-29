class UsersController < ApplicationController
  def dashboard
    @lists = current_user.lists
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(:user)
  end

  def create
    @user = User.find(params[:user])
    @user.save
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
