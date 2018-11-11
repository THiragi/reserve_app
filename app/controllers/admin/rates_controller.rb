class Admin::RatesController < Admin::BaseController

  def index
    @rates = Rate.all
  end

  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(rate_params)
    if @rate.save
      redirect_to admin_rates_url
    end
  end

  def edit
    @rate = Rate.find(params[:id])
  end

  def update
    @rate = Rate.find(params[:id])
    @rate.update(rate_params)
    redirect_to admin_rates_url
  end

  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy
    redirect_to admin_rates_url
  end

  private
    def rate_params
      params.require(:rate).permit(:rate_type, :amount, :rank, :start_date, :end_date, :weekday, :room_type_id)
    end
end
