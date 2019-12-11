class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.read = false
    authorize @contact

    if @contact.save
      ContactsMailer.general_message(@contact).deliver
      render :thanks
    else
      redirect_to contact_path
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
