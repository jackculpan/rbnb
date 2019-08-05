class ReviewsController < ApplicationController
  before_action :find_booking, :find_review
  def index
    @reviews = Review.all
  end

  def show
    @review = find_review
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to booking_review_path(find_review[:id])
    else
      render :new
    end
  end

  def edit
    @review = find_review[:id]
  end

  def update
    @review = find_review
    if @review.update(review_params)
      redirect_to booking_review_path(find_review[:id])
    else
      render :edit
    end
  end

  def destroy
    @review = find_review
    @review.destroy
    redirect_to booking_path(find_booking[:booking_id])
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
