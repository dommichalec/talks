class RegistrationsController < ApplicationController
  before_action :set_talk, only: [:index, :new, :create]
  before_action :require_signin
  before_action :require_admin, only: [:show, :index]

  def index
    @registrations = @talk.registrations
  end

  def new
    @registration = @talk.registrations.new
  end

  def create
    @registration = @talk.registrations.new(registration_params)
    @registration.user = current_user
    if @registration.save
      redirect_to @talk, notice: "Boom! You're registered for #{@talk.title} with #{@talk.speaker}. We'll email you with details here shortly!"
    else
      render :new
    end
  end

  private

  def set_talk
    @talk = Talk.find(params[:talk_id])
  end

  def registration_params
    params.require(:registration).permit(:question)
  end
end
