class Reservation < ApplicationRecord

  enum status:{apply: 0, approve: 1, refuse: 2, cancel: 3, arrive: 4, leave: 5}

  validates :reserve_no, presence: true, uniqueness: true
  validates :guest_name, presence: true
  validates :guest_phone, presence: true, numericality: :true, length: { in: 10..15 }
  validates :guest_mail, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :room_id, presence: true
  validates :guest_count, presence: true
  validates :status, presence: true
  validate :in_date_cannot_be_in_the_past
  validate :out_date_cannot_be_before_the_in_date

  def in_date_cannot_be_in_the_past
    if check_in_date.present? && check_in_date < Date.today
      errors.add(:check_in_date, "過去の日付は使用できません")
    end
  end

  def out_date_cannot_be_before_the_in_date
    if check_out_date < check_in_date
      errors.add(:check_out_date, "チェックイン日より前の日付は使用できません")
    end
  end

  def self.get_reserve(room_id, date)
    reserves = where(room_id: room_id)
    reserves.find_by('check_in_date <= ? AND check_out_date > ?', date, date)
  end


end
