class ReviewsController < ApplicationController

  before_action :get_review, :only => [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    render "application/not_authorized" unless current_user
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

  def get_review
    @review = Review.find(id)
  end
end
