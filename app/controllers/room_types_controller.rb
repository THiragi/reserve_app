class RoomTypesController < ApplicationController

  def show
    @room_type = RoomType.find(params[:id])
  end

end
