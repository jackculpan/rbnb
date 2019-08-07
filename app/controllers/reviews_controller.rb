class ReviewsController < ApplicationController
  before_action :set_booking, :only [:show, :create, :edit, :update, :destroy]

  def show
    @review = Review.find(params[:id])
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
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    authorize @review
    if @review.update(review_params)
      redirect_to booking_path(@booking[:id])
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to booking_path(@booking[:id])
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
