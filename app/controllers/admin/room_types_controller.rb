class Admin::RoomTypesController < Admin::BaseController

  def index
    @room_types = RoomType.all
  end

  def show
    @room_type = RoomType.find(params[:id])
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
    @room_type = RoomType.find(params[:id])
  end

  def update
    @room_type = RoomType.find(params[:id])
    @room_type.update(room_type_params)
    redirect_to admin_room_types_url
  end

  def destroy
    @room_type = RoomType.find(params[:id])
    @room_type.destroy
    redirect_to admin_room_types_url
  end

  private
    def room_type_params
      params.require(:room_type).permit(:type_name, :capacity, :image, :room_note)
    end

end
