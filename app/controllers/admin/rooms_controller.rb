class Admin::RoomsController < Admin::BaseController

  def index
  end

  def new
    @room = Room.new
    @room_type_id = params[:room_type_id]
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to admin_room_types_url
    end
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
