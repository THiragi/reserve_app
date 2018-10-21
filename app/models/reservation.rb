class Reservation < ApplicationRecord
  validates :reserve_no, presence: true, uniqueness: true
  validates :guest_name, presence: true
  validates :guest_phone, presence: true
  validates :guest_mail, presence: true
  validates :guest_count, presence: true


end
