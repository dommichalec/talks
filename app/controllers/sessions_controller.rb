class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate(params[:email_address], params[:password])
      session[:user_id] = user.id
      redirect_to session[:last_requested_url] || root_path, notice: "Welcome back, #{user.first_name}!"
      session[:last_requested_url] = nil
    else
      flash.now[:notice] = "Ah snap! Doesn't look like that email/password combo is correct."
      render :new
    end
  end

  def destroy
    @user = current_user
    session[:user_id] = nil
    redirect_to root_path, notice: "You're all signed out, #{@user.first_name}. See you again soon!"
  end
end
