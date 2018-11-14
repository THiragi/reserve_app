class NotificationMailer < ApplicationMailer
  default from: ENV['SMTP_MAIL']

  def confirm_apply(reservation)
    @reservation = reservation
    mail to: ENV['SMTP_MAIL'],
      subject: "予約の申請がありました"
  end

  def thanks_for_apply(reservation)
    @reservation = reservation
    mail to: @reservation.guest_mail,
      subject: "予約申請を受け付けました"
  end

  def confirm_approve(reservation)
    @reservation = reservation
    mail to: @reservation.guest_mail,
      subject: "予約が承認されました"
  end

  def confirm_refuse(reservation)
    @reservation = reservation
    mail to: @reservation.guest_mail,
      subject: "予約が承認されませんでした"
  end

  def confirm_cancel(reservation)
    @reservation = reservation
    mail to: @reservation.guest_mail,
      subject: "予約がキャンセルされました"
  end

end
