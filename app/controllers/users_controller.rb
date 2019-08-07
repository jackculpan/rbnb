class UsersController < ApplicationController
  def dashboard
    @bookings_i_made = current_user.bookings
    @bookings_i_received = Booking.join(:pools).where(user: current_user)
    @pools_i_own = Pool.where(user: current_user)
  end
end
