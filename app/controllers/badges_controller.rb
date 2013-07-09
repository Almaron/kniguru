class BadgesController < ApplicationController
    
  before_action :require_user
  before_action :set_badge, :only => [:show, :edit, :update, :destroy]
  
  def index
      @Badges = Badge.find_all_by(:type => "dinamic")
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
      @badge.update(params[:badge])
  end

  def destroy
      @badge.destroy
      redirect_to badges_path
  end
  
  private
  
  def set_badge
      @badge = Badge.find(params[:id])
  end
  
end
