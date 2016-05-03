class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to @talk, notice: "#{@talk.title} has been updated!"
    else
      render :edit
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :topic, :speaker, :speaker_profile, :date)
  end
end
