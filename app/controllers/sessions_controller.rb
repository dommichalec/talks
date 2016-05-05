class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate(params[:email_address], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.first_name}!"
    else
      flash.now[:notice] = "Ah snap! Doesn't look like that email/password combo is correct."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You're all signed out. See you soon!"
  end
end
