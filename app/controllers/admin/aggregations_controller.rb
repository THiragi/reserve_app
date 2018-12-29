class Admin::AggregationsController < Admin::BaseController
  def index
  end

  def month
  end

  def day
    @reservations = Reservation.all
  end

end
