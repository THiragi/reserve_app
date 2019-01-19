class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @room_id = params[:reservation][:room_id]
    @guest_count = params[:reservation][:guest_count]
    @in_date = Date.parse(params[:reservation][:check_in_date])
    @out_date = Date.parse(params[:reservation][:check_out_date])
    @amount = params[:reservation][:amount]
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room_id = params[:reservation][:room_id]
    @guest_count = params[:reservation][:guest_count]
    @in_date = Date.parse(params[:reservation][:check_in_date])
    @out_date = Date.parse(params[:reservation][:check_out_date])
    @amount = params[:reservation][:amount]

    if @reservation.save
      NotificationMailer.thanks_for_apply(@reservation).deliver_now
      NotificationMailer.confirm_apply(@reservation).deliver_now
      render 'create'
    else
      render 'new'
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
    if @reservation.update(reservation_params)
      flash[:success] ="予約内容を変更しました"
      redirect_to search_reservations_url
    else
      render 'edit'
    end
  end

  def cancel
    @reservation = Reservation.find(params[:id])
    if @reservation.approve? or @reservation.arrive?
       @reservation.cancel!
       NotificationMailer.confirm_cancel(@reservation).deliver_now
      flash[:success] ="予約をキャンセルしました"
       redirect_to search_reservations_url
    end
  end

  def destroy

  end

  private
    def reservation_params
      params.require(:reservation).permit(:reserve_no, :guest_name, :guest_mail, :guest_phone, :check_in_date, :check_out_date, :room_id, :guest_count, :stay_note, :status, :apply_date)
    end
end
