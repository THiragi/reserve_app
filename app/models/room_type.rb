class RoomType < ApplicationRecord
  has_many :rooms
  validates :type_name, presence: true, uniqueness: true
  validates :capacity, presence: true

  mount_uploader :image, ImageUploader

end
