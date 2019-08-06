class ReviewsController < ApplicationController

  before_action :set_reviews, :only [:show, :edit, :update, :destroy]


  def show
    @reviews = @booking.reviews
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to booking_path(@booking)
    else
      render "edit"
    end
  end

  def destroy
    @review.destroy
    redirect_to booking_path(@booking)
  end

  private

    def set_reviews
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
