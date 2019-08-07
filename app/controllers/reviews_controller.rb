class ReviewsController < ApplicationController
  before_action :set_booking, only: [:show, :create, :edit, :update, :destroy]

  def show
    @reviews = @booking.reviews
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to booking_path(@booking[:id])
    else
      render "new"
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to booking_path(@booking[:id])
    else
      render "edit"
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to booking_path(@booking[:id])
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
