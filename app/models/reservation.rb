class Reservation < ApplicationRecord
  validates :reserve_no, presence: true, uniqueness: true
  validates :guest_no, presence: true
  validates :guest_phone, presence: true
  validates :guest_mail, presence: true
  validates :check_in_date, presence: true, :in_date_check
  validates :check_out_date, presence: true, :out_date_check
  validates :room_id, presence: true, uniqueness: { scope: [:duration_of_stay]}
  validates :guest_count, presence: true

  def in_date_check
    check_in_date => Date.today
  end

  def out_date_check
    check_out_date => check_in_date
  end

  def duration_of_stay
    check_in_date..check_out_date
  end

end
