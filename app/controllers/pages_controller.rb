class PagesController < ApplicationController
  def index
  end

  def show
    if params[:main]
      render :text => "", :layout => "root"
    else
      @page = Page.find_by(:page_alias => params[:id])
      render :text => "", :layout => "root" unless @page
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to "/pages/#{@page.page_alias}"
    else
      render :new
    end
  end

  def edit
    @page = Page.find_by(:page_alias => params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to "/pages/#{@page.page_alias}"
    else
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to root_path
  end

  private

  def page_params
    params.require(:page).permit(:title, :head, :content, :page_alias)
  end
end
