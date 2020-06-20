class Contact < ApplicationRecord
  validates_presence_of :first_name, :last_name, :message, :email
  after_create :send_contact_queries_email_to_admin

  def send_contact_queries_email_to_admin
    ContactMessageMailer.contact_message_mail(self).deliver
  end
end
