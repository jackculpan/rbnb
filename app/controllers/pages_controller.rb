class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @bookings_i_made = current_user.bookings
    @bookings_i_received = Booking.join(:pools).where(user: current_user)
  end
end
