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
       redirect_to admin_reservations_path
    end
  end

  def refuse
    @reservation = Reservation.find(params[:id])
    if @reservation.apply?
       @reservation.refuse!
       redirect_to admin_reservations_path
    end
  end

  def cancel
    @reservation = Reservation.find(params[:id])
    if @reservation.approve? or @reservation.arrive?
       @reservation.cancel!
       redirect_to admin_reservations_path
    end
  end

  def arrive
    @reservation = Reservation.find(params[:id])
    if @reservation.approve?
       @reservation.arrive!
       redirect_to admin_reservations_path
    end
  end


  def leave
    @reservation = Reservation.find(params[:id])
    if @reservation.arrive?
       @reservation.leave!
       redirect_to admin_reservations_path
    end
  end


end
