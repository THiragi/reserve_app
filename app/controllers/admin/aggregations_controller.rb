class Admin::AggregationsController < Admin::BaseController
  def index
  end

  def month
  end

  def day
    if params[:day].present?
      @date = Date.parse(params[:day])
    else
      @date = Date.today
    end
    @reservations = Reservation.aggregate(@date)
  end

end
