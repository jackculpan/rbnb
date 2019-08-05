class BookingsController < ApplicationController
  before_action :find_pool, :find_user
  def index
    @bookings = Booking.all
  end

  def show
    @booking = find_booking
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking[:id])
    else
      render :new
    end
  end

  def edit
    @booking = find_booking[:id]
  end

  def update
    @booking = find_booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking[:id])
    else
      render :edit
    end
  end

  def destroy
    @booking = find_booking
    @booking.destroy
    redirect_to bookings_path(find_user[:user_id])
  end

  private

  def find_pool
    @pool = Pool.find(params[:pool_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:total_amount, :pool_id, :user_id,:start_date, :end_date)
  end
end
