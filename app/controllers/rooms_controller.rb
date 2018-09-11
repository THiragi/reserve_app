class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(created_at: 'asc')
  end
  
end
