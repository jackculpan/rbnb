class UsersController < ApplicationController
  def dashboard
    @bookings_i_made = current_user.bookings
    @bookings_i_received = Booking.joins(:pool).where(user: current_user)
    @pools_i_own = Pool.where(user: current_user)
    authorize @bookings_i_made
    authorize @bookings_i_received
    authorize @pools_i_own

  end
end
