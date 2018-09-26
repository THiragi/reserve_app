class RoomsController < ApplicationController
  def index
    @room_types = RoomType.all.order(created_at: 'asc')
    @rooms = Room.all.order(created_at: 'asc')
  end

  def show
    @room = Room.find(params[:id])
    @room_type = @room.room_type
    @start = Date.today.beginning_of_week(:sunday)
    @rates = Rate.where(room_type_id: @room_type.id)
  end

  def prev

  end

  def next
    
  end

end
