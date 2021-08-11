class ContactMailer < ApplicationMailer
  ADMIN_EMAIL = "tokki2tokki@gmail.com"

  def user_email(contact)
    @contact = contact
    @name = contact.name.present? ? contact.name : contact.email
    subject = "【Tokki Design】 Your inquiry has been received."

    mail(to: contact.email, subject: subject)
  end

  def admin_email(contact)
    @contact = contact
    @name = contact.name.present? ? contact.name : contact.email
    subject = "【Tokki Design】 You have an inquiry."

    mail(to: ADMIN_EMAIL, subject: subject)
  end
end
