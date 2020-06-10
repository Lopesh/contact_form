class ContactMessageMailer < ApplicationMailer
  default to: "durugkarlopesh@gmail.com"

  def contact_message_mail(contact)
    @contact = contact
    mail(from: contact.email, subject: "Queries")
  end
end
