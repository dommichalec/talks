class RegistrationsController < ApplicationController

  def index
    @talk = Talk.find(params[:talk_id])
    @registrations = @talk.registrations
  end

  def new
    @talk = Talk.find(params[:talk_id])
    @registration = @talk.registrations.new
  end
end
