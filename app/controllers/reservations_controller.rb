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
      NotificationMailer.message_to_customer(@reservation).deliver_now
      render 'create'
    else
      render action: :new
    end
  end

  def search
    @reservation = Reservation.search(params[:search])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to search_reservations_url
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:success] = "Reservation deleted"
    redirect_to search_reservations_url
  end

  private
    def reservation_params
      params.require(:reservation).permit(:reserve_no, :guest_name, :guest_mail, :guest_phone, :check_in_date, :check_out_date, :room_id, :guest_count, :stay_note, :status)
    end
end
