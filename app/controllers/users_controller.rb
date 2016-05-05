class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only:[:edit, :update, :destroy]

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
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome to hacker_talks, #{@user.first_name}! You're all set and ready to go."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Your account has been successfully updated"
    else
      render :edit
    end
  end

  def destroy
    first_name = @user.first_name
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "We're sorry to see you go, #{first_name}! We hope you come back soon."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_path, notice: "Hey now! You can't go editing other people's accounts."
    end
  end
end
