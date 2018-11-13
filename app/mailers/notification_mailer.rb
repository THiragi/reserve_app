class NotificationMailer < ApplicationMailer
  default from: ENV['SMTP_MAIL']

  def notice_to_admin(reservation)
    @reservation = reservation
    mail to: ENV['SMTP_MAIL'],
      subject: "予約の申請がありました"
  end

  def message_to_customer(reservation)
    @reservation = reservation
    mail to: @reservation.guest_mail,
      subject: "予約申請を受け付けました"
  end

end
