class Admin::RoomsController < Admin::BaseController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def room_params
      params.require(:room).permit(:room_type_id, :room_name)
    end
end
