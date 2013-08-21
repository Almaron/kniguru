class ExpertsController < ApplicationController

  before_action :get_expert, :only => [:show, :edit, :update, :destroy]

  def index
    @experts = Expert.all
  end

  def show

  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.create(expert_params)
    redirect_to experts_path
  end

  def edit
  end

  def update
    @expert.update expert_params
    redirect_to experts_path
  end

  def destroy
    @expert.destroy
    redirect_to experts_path
  end

  private

  def get_expert
    @expert = Expert.find(params[:id])
  end

  def expert_params
    params.require(:expert).permit(:name, :content)
  end

end
