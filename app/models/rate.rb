class Rate < ApplicationRecord
  belongs_to :room_type
  validates :rate_type, presence: true
  validates :amount, presence: true
  validates :rank, presence: true
  validates :room_type_id, presence: true

  def self.get_amount(room_type_id, date)
    rates = where(room_type_id: room_type_id)
    rates = rates.where('start_date < ? AND end_date > ? OR weekday = ?', date, date, date.wday)
    rank = rates.minimum('rank')
    rates.find_by(rank: rank)
  end

end
