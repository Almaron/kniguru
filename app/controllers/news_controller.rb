class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]


  def index
    @news = News.all
  end


  def show
      @comment = @news.comments.new
  end


  def new
    @news = News.new
  end


  def edit
  end


  def create
    @news = News.new(news_params)
      if @news.save
        redirect_to @news, notice: 'News was successfully created.'
      else
        render action: 'new' 
      end
  end

  def update
      if @news.update(news_params)
        redirect_to @news, notice: 'News was successfully updated.' 
      else
        render action: 'edit' 
      end
  end


  def destroy
    @news.destroy
       redirect_to news_index_path
    end
  end

  private
    
    def set_news
      @news = News.find(params[:id])
    end

    
    def news_params
      params.require(:news).permit(:head, :text, :image)
    end
end
