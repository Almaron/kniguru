class PressesController < ApplicationController
  before_action :set_press, only: [:show, :edit, :update, :destroy]

  def index
    @presses = Press.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @press = Press.new
  end

  def edit
  end

  def create
    @press = Press.new(press_params)
      if @press.save
        redirect_to @press, notice: 'Press was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
      if @press.update(press_params)
        redirect_to @press, notice: 'Press was successfully updated.'
      else
        render action: 'edit'
      end
  end


  def destroy
    @press.destroy
    redirect_to presses_url
  end

  private
    def set_press
      @press = Press.find(params[:id])
    end

    def press_params
      params.require(:press).permit(:head, :content, :paper_name, :paper_url, :published_on)
    end
end
