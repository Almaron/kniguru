class SeasonsController < ApplicationController
    
before_action :set_season, :only => [:show, :edit, :update, :destroy]

  def index
    @seasons = Season.all
  end

  def show
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.create(season_params)
    redirect_to seasons_path
  end

  def edit
  end

  def update
    @season.update(season_params)
    redirect_to seasons_path
  end

  def destroy
    @season.destroy
    redirect_to seasons_path
  end
  
  private
  
  def set_season
      @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:title, :start_on, :end_on)
  end
end
