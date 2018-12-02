class RoomTypesController < ApplicationController

  def index
    @room_types = RoomType.all.order(created_at: 'asc')
  end

  def show
    @room_type = RoomType.find(params[:id])
  end

end
