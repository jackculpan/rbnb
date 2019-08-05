class ReviewsController < ApplicationController

  before_action :set_reviews, :only [:show, :edit, :update, :destroy, :chef]

  def index
    @reviews.all
  end

  def show
    @reviews = @booking.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path #go to home page ?
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to reviews_path #go to the updated review
    else
      render "edit"
    end
  end

  def destroy #go to homepage ?
    @review.destroy
  end

  private

    def set_reviews
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
