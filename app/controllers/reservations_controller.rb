class ReservationsController < ApplicationController
  def apply
    @reservation = Reservation.new
    @room_name = params[:reservation][:roomname]
    @room_type = params[:reservation][:roomtype]
    @guest_count = params[:reservation][:guestcount]
    @amount = params[:reservation][:amount]
    @in_date = Date.parse(params[:reservation][:checkin])
    @out_date = Date.parse(params[:reservation][:checkout])
  end

  def create
    @reservation = Reservation.new
  end

  def destroy
  end
end
