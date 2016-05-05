class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Welcome, #{@user.first_name}! You're all set to register for talks."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "Your account has been successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    first_name = @user.first_name
    @user.destroy
    redirect_to root_path, notice: "We're sorry to see you go, #{first_name}! We hope you come back soon."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end
end
