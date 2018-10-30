class Admin::ReservationsController < ApplicationController
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

  end


end
