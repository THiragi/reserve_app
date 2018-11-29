class Rate < ApplicationRecord
  belongs_to :room_type
  validates :rate_type, presence: true
  validates :amount, presence: true
  validates :rank, presence: true
  validates :room_type_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.get_amount(room_type_id, date)
    rates = where(room_type_id: room_type_id).where('(start_date <= ? AND end_date >= ?)', date, date)

    if rates.where(weekday: date.wday).any?
      rates = rates.where(weekday: date.wday)
    else
      rates = rates.where(weekday: nil)
    end

    rank = rates.minimum('rank')
    rates.find_by(rank: rank)
  end


end
