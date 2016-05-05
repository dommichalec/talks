class RegistrationsController < ApplicationController
  before_action :require_signin

  def index
    @talk = Talk.find(params[:talk_id])
    @registrations = @talk.registrations
  end

  def new
    @talk = Talk.find(params[:talk_id])
    @registration = @talk.registrations.new
  end

  def create
    @talk = Talk.find(params[:talk_id])
    @registration = @talk.registrations.new(registration_params)
    @registration.user = current_user
    if @registration.save
      redirect_to root_path, notice: "Boom! You're registered for #{@talk.title} with #{@talk.speaker}. We'll email you with details here shortly!"
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:question)
  end
end
