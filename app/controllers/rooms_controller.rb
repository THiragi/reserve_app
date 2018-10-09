class RoomsController < ApplicationController
  def index
    @room_types = RoomType.all.order(created_at: 'asc')
    @rooms = Room.all.order(created_at: 'asc')
  end

  def show
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @start = Date.today.beginning_of_week(:sunday)
  end

  def prev
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    Rails.logger.debug("##################")
    Rails.logger.debug(params[:date])
    @start = Date.parse(params[:date]).weeks_ago(2)
    Rails.logger.debug(@start)

    render partial: 'calendar', locals: {start: @start, room_type: @room_type}

  end

  def next
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @start = Date.parse(params[:date]).weeks_since(2)
    render partial: 'calendar', locals: {start: @start, room_type: @room_type}
  end

  def calc
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @in_date = Date.parse(params[:checkin])
    @out_date = Date.parse(params[:checkout])
    @guest_count = params[:guestcount]
#    @per_stays = out_date - in_date
    render partial: 'result',  locals: {start: @start, room_type: @room_type}
  end



end
