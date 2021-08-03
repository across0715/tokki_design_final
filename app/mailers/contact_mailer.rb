class ContactMailer < ApplicationMailer
  def user_email(name:, email:)
    @name = name
    mail(
      to: email,
      subject: "【Tokki Design】Your inquiry has been received.",
    )
  end

  def admin_email
  end
end
