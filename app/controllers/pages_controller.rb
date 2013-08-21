class PagesController < ApplicationController
  def index
  end

  def show
    debugger
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
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy redirect_to pages_path
  end
end
