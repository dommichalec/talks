class LikesController < ApplicationController
  before_action :require_signin
  before_action :set_event, only: [:create, :destroy]

  def create
    @talk.likes.create!(user: current_user)
    redirect_to @talk, notice: "Glad you found #{@talk.title} helpful!"
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy
    redirect_to @talk, notice: "Ah, sorry you didn't find #{@talk.title} very helpful!"
  end

  private

  def set_event
    @talk = Talk.find(params[:talk_id])
  end
end
