class RegistrationsController < ApplicationController

  def index
    @talk = Talk.find(params[:talk_id])
    @registrations = @talk.registrations
  end

end
