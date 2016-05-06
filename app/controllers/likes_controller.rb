class LikesController < ApplicationController
  before_action :require_signin

  def create
    @talk = Talk.find(params[:talk_id])
    @talk.likes.create!(user: current_user)
    redirect_to @talk, notice: "Glad you found #{@talk.title} helpful!"
  end
end
