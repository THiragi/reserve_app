class Room < ApplicationRecord
  belongs_to :room_type

  validates :room_name, presence: true, uniqueness: true
  validates :room_type_id, presence: true
  

end
