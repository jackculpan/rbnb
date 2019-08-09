class ReviewsController < ApplicationController
  before_action :set_booking, only: [:show, :create]
  before_action :set_review, only: [:edit, :update, :destroy]

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
    # if @review.save
    #   redirect_to booking_path(@booking[:id])
    # else
    #   render "new"
    # end

    if @review.save
      respond_to do |format|
        format.html { redirect_to booking_path(@booking) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js  # <-- idem
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    # set_review
    authorize @review
    if @review.update(review_params)
      redirect_to booking_path(@review.booking)
    else
      render "edit"
    end
  end

  def destroy
    authorize @review
    if @review.destroy
      respond_to do |format|
        format.html { redirect_to @review.booking }
        format.js  # <-- will render `app/views/reviews/destroy.js.erb`
      end
    else
      respond_to do |format|
        format.js  # <-- idem
      end
    end
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
