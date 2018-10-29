class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @reservations = Reservation.all.order(created_at: :desc)
    end

    def show
      @reservation = Reservation.find(params[:id])
    end

end
