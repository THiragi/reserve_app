class Admin::RoomTypesController < Admin::BaseController

  def index
    @room_types = RoomType.all
  end

  def new
    @room_type = RoomType.new
  end

  def create
    @room_type = RoomType.new(room_type_params)
    if @room_type.save
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
    def room_type_params
      params.require(:room_type).permit(:type_name, :capacity, :image, :room_note)
    end

end
