class NotificationMailer < ApplicationMailer
  default from: "admin@gmail.com"

  def message_to_customer(reservation)
    @reservation = reservation
    mail to: @reservation.guest_mail,
      subject: "件名"
  end

end
