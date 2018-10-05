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
#    render 'show'
    render partial: 'calendar', locals: {start: @start, room_type: @room_type}
#    respond_to do |format|
#      format.html
#      format.js
#    end

  end

  def next
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @start = Date.parse(params[:date]).weeks_since(2)
#    render 'show'
    render partial: 'calendar', locals: {start: @start, room_type: @room_type}
  end



end
