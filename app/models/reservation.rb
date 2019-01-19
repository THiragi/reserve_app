class Reservation < ApplicationRecord

  enum status:{apply: 0, approve: 1, refuse: 2, cancel: 3, arrive: 4, leave: 5}

  validates :reserve_no, presence: true, uniqueness: true
  validates :guest_name, presence: true
  validates :guest_phone, presence: true, numericality: :true, length: { in: 10..15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :guest_mail, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :apply_date, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :room_id, presence: true
  validates :guest_count, presence: true
  validates :status, presence: true
  validate :in_date_cannot_be_in_the_past
  validate :out_date_cannot_be_before_the_in_date
  validate :reserves_overlap

  def reserves_overlap
     reservations = Reservation.where(room_id: self.id).where('check_in_date <= ? AND ? <= check_out_date', self.check_out_date, self.check_in_date)
     reservations = reservations.where.not(id: self.id) if !self.new_record?

     errors.add(:check_in_date, "その期間はすでに予約が入っています") if reservations.any?
  end

  def in_date_cannot_be_in_the_past
    errors.add(:check_in_date, "申請日より前の日付は使用できません") if check_in_date < apply_date
  end

  def out_date_cannot_be_before_the_in_date
    errors.add(:check_out_date, "チェックイン日より前の日付は使用できません")  if check_out_date < check_in_date
  end

  def self.get_reserve(room_id, date)
    reserves = where(room_id: room_id)
    reserves.find_by('check_in_date <= ? AND check_out_date > ?', date, date)
  end

  def self.get_by_date(date)
    where('check_in_date <= ? AND check_out_date > ?', date, date)
  end

  def self.search(search)
    where('reserve_no = ?', search)
  end

  def self.date_check(room_id, in_date, out_date)
    where(room_id: room_id).where('check_in_date < ? AND ? < check_out_date', out_date, in_date)
  end

end
