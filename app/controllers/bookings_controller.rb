class BookingsController < ApplicationController
  before_action :set_pool, :set_user
  def index
    @bookings = policy_scope(Booking)
    authorize @booking
  end

  def show
    @booking = find_booking
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking[:id])
    else
      render :new
    end
  end

  def edit
    @booking = find_booking[:id]
    authorize @booking
  end

  def update
    @booking = find_booking
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking[:id])
    else
      render :edit
    end
  end

  def destroy
    @booking = find_booking
    authorize @booking
    @booking.destroy
    redirect_to bookings_path(find_user[:user_id])
  end

  private

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:total_amount, :pool_id, :user_id, :start_date, :end_date)
  end
end
