class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @room_id = params[:reservation][:room_id]
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
