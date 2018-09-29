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
    @start = Date.parse(params[:date]).weeks_ago(2)
    render partial: 'calendar', locals: {start: @start, room_type: @room_type}
  end

  def next
    @start = Date.parse(params[:date]).weeks_since(2)
    render partial: 'calendar', locals: {start: @start, room_type: @room_type}
  end



end
