class BookingsController < ApplicationController
  before_action :set_pool, only: [:create]

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.total_amount = (@booking.end_date - @booking.start_date) * @pool.price
    @booking.pool = @pool
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboard_users_path
    else
      render "pools/show"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking[:id])
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.destroy
      respond_to do |format|
        format.js  # <-- will render `app/views/reviews/destroy.js.erb`
      end
    else
      respond_to do |format|
        format.js  # <-- idem
      end
    end
  end

  private

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end

  def set_user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:total_amount, :start_date, :end_date)
  end
end
