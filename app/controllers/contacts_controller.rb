class ContactsController < ApplicationController
  protect_from_forgery with: :null_session
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_contact_params)
    respond_to do |format|
      if @contact.save
        ContactMessageMailer.contact_message_mail(@contact).deliver
        format.html { redirect_to '/', flash: { success: ['Message Send Successfully.'] }}
        format.json { render json: @contact, status: :created }
      else
        format.html { redirect_to '/', flash: { error: @contact.errors.full_messages }}
        format.json { render json: @contact, status: :created }
      end
    end
  end

  private
  def set_contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
  end
end
