class ReservationsController < ApplicationController
  def apply
    @reservation = Reservation.new
    @guest_count = params[:guest_count]
  end

  def create
    @reservation = Reservation.new
  end

  def destroy
  end
end
