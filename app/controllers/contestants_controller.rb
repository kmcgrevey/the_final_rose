class ContestantsController < ApplicationController

  def index
    @bach = Bachelorette.find(params[:bachelorette_id])
  end

  def show
    @contestant = Contestant.find(params[:id])
  end
end