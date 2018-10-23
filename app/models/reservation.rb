class Reservation < ApplicationRecord
  validates :reserve_no, presence: true, uniqueness: true
  validates :guest_name, presence: true
  validates :guest_phone, presence: true
  validates :guest_mail, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :room_id, presence: true
  validates :guest_count, presence: true



  def check_in_cannot_be_in_the_past

  end

  def self.get_reserve(room_id, date)
    reserves = where(room_id: room_id)
    reserves.find_by('check_in_date <= ? AND check_out_date > ?', date, date)
  end


end
