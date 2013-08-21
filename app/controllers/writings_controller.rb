class WritingsController < ApplicationController
  before_action :set_writing, only: [:show, :edit, :update, :destroy]

  def index
    @writings = Writing.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @writing = Writing.new
  end

  def edit
  end

  def create
    @writing = writing.new(writing_params)
    if @writing.save
      redirect_to @writing, notice: 'writing was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @writing.update(writing_params)
      redirect_to @writing, notice: 'writing was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def destroy
    @writing.destroy
    redirect_to writings_url
  end

  private
  def set_writing
    @writing = Writing.find(params[:id])
  end

  def writing_params
    params.require(:writing).permit(:head, :content, :paper_name, :paper_url, :published_on)
  end
end
