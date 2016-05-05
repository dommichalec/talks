class TalksController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @talks = Talk.upcoming
  end

  def show
    @talk = Talk.find(params[:id])
    if @talk.sold_out?
      redirect_to root_path, notice: "#{@talk.title} with #{@talk.speaker} is no longer accepting registrations"
    else
      render :show
    end
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to @talk, notice: "#{@talk.title} with #{@talk.speaker} has been updated!"
    else
      render :edit
    end
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to root_path, notice: "#{@talk.title} with #{@talk.speaker} has been added to upcoming talks!"
    else
      render :new
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    title, speaker = @talk.title, @talk.speaker
    @talk.destroy
    redirect_to root_path, notice: "#{title} with #{speaker} has been successfully removed from the site!"
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :topic, :speaker, :speaker_profile, :date, :capacity)
  end
end
