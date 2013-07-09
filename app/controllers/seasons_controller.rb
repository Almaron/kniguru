class SeasonsController < ApplicationController
    
before_action :set_season, :except => [:index, :new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def set_season
      @season = Season.find(params[:id])
  end
end
