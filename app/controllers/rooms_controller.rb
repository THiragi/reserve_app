class RoomsController < ApplicationController
  def index
    @room_types = RoomType.all.order(created_at: 'asc')
    @rooms = Room.all.order(created_at: 'asc')
  end

  def show
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @start = Date.today.beginning_of_week(:sunday)
    @bpoint = 0
  end

  def prev
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    Rails.logger.debug("##################")
    Rails.logger.debug(params[:prevstart])
    @start = Date.parse(params[:prevstart]).weeks_ago(2)
    @bpoint = (params[:bpoint]).to_i
    @bpoint -= 1
    Rails.logger.debug(@start)
    Rails.logger.debug(@bpoint)

    render partial: 'calendar', locals: {start: @start, room: @room, room_type: @room_type, bpoint: @bpoint}

  end

  def next
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    Rails.logger.debug("##################")
    Rails.logger.debug(params[:nextstart])
    @start = Date.parse(params[:nextstart]).weeks_since(2)
    @bpoint = (params[:bpoint]).to_i
    @bpoint += 1
    Rails.logger.debug(@start)
    Rails.logger.debug(@bpoint)

    render partial: 'calendar', locals: {start: @start, room: @room, room_type: @room_type, bpoint: @bpoint}

  end

  def calc
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @in_date = Date.parse(params[:checkin])
    @out_date = Date.parse(params[:checkout])
    @guest_count = params[:guestcount]
    @reservation = Reservation.new

    if Reservation.date_check(@room.id, @in_date, @out_date).any?
      render plain: "その日はすでに予約されています", status: 201
    else
      render partial: 'result',  locals: {start: @start, room: @room, room_type: @room_type}, status: 200
    end
  end



end
