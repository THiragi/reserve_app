class Rate < ApplicationRecord
  belongs_to :room_type
  validates :rate_type, presence: true
  validates :amount, presence: true
  validates :rank, presence: true
  validates :room_type_id, presence: true
end
