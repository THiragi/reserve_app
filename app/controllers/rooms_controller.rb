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

    render partial: 'calendar', locals: {start: @start, room: @room, room_type: @room_type}

  end

  def next
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @start = Date.parse(params[:date]).weeks_since(2)
    render partial: 'calendar', locals: {start: @start, room: @room, room_type: @room_type}
  end

  def calc
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @in_date = Date.parse(params[:checkin])
    @out_date = Date.parse(params[:checkout])
    @guest_count = params[:guestcount]
    @reservation = Reservation.new
#    if Reservation.date_check(@room.id, @in_date, @out_date).any?
#      render text: "その日はすでに予約されています", status: 201
#    else
      render partial: 'result',  locals: {start: @start, room: @room, room_type: @room_type}
#    end
  end



end
