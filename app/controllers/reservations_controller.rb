class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @room_id = params[:reservation][:room_id]
    @guest_count = params[:reservation][:guestcount]
    @in_date = Date.parse(params[:reservation][:checkin])
    @out_date = Date.parse(params[:reservation][:checkout])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render 'create'
    else
      render action: :new
    end
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:reserve_no, :guest_name, :guest_mail, :guest_phone, :check_in_date, :check_out_date, :room_id, :guest_count, :stay_note)
    end
end
