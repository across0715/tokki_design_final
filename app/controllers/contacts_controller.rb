class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  endp

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.user_email(@contact).deliver_now

      ContactMailer.admin_email(@contact).deliver_now
      flash[:danger] = "Your message has been sent."
      redirect_to root_path
    else
      render :index
    end
  end

  private

  # IPアドレスをパラメータに追加
  def contact_params
    params.require(:contact)
          .permit(:name, :email, :content, :submitted, :confirmed)
          .merge(remote_ip: request.remote_ip)
  end
end
