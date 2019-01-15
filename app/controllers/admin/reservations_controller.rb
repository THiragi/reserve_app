class Admin::ReservationsController < Admin::BaseController
  before_action :authenticate_admin!

  def index
    @reservations = Reservation.all.order(created_at: :desc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def approve
    @reservation = Reservation.find(params[:id])
    if @reservation.apply?
       @reservation.approve!
       NotificationMailer.confirm_approve(@reservation).deliver_now
       Rails.logger.debug(params[:action])
       redirect_to admin_reservations_path
    end

  end

  def refuse
    @reservation = Reservation.find(params[:id])
    if @reservation.apply?
       @reservation.refuse!
       NotificationMailer.confirm_refuse(@reservation).deliver_now
       redirect_to admin_reservations_path
    end

  end

  def cancel
    @reservation = Reservation.find(params[:id])
    if @reservation.approve? or @reservation.arrive?
       @reservation.cancel!
       NotificationMailer.confirm_cancel(@reservation).deliver_now
       redirect_to admin_reservations_path
       flash[:tab_2] = true
    end

  end

  def arrive
    @reservation = Reservation.find(params[:id])
    if @reservation.approve?
       @reservation.arrive!
       redirect_to admin_reservations_path
       flash[:tab_2] = true
    end

  end


  def leave
    @tab_3 = true
    @reservation = Reservation.find(params[:id])
    if @reservation.arrive?
       @reservation.leave!
       redirect_to admin_reservations_path
       flash[:tab_3] = true
    end

  end


end
