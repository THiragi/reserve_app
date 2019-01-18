class Admin::AggregationsController < Admin::BaseController
  def index
    @reservations = Reservation.all
    @today = Date.today
  end



  def month
  end

  def day
    @reservations = Reservation.all

    if params[:today].blank?
      @today = Date.today
    else
      @today = Date.parse(params[:today])
    end
  end

end
