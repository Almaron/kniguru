class BooksController < ApplicationController
    
    before_action :set_book, :only => [:show,:edit,:update,:destroy, :rate]
    
  def index
      @books = Book.order(:created_at => :desc)
  end

  def show
  end

  def new
      @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      if @book.save
          redirect_to :book
      else
          render :new
      end
  end

  def edit
  end

  def short_list
    @books = current_season ? current_season.books.short_list : []
  end

  def update
      if @book.update(book_params)
          redirect_to @book, :notice => "Update success"
      else
          render :edit
      end
  end

  def destroy
      @book.destroy
      redirect_to books_path, :notice => "Book deleted."
  end
  
  def rating
      @books = current_season.books.all.shuffle      
  end
  
  def rate
      if (@rate = @book.rates.find_by(:user_id => current_user.id))
          @rate.update(:rate => params[:rate])
      else
          @book.rates.create(:user_id => current_user.id, :rate => :params[:rate])
      end
      redirect_to rating_books_path, :notice => "Book rated"
  end
  
  def search
      search = params[:string]
      @books = Book.search(search)
      @comments = Comment.search(search)
  end
  
  private 
  
  def set_book
      @book = Book.find(params[:id])
  end
  
  def book_params
      params.require(:book)
  end
end
