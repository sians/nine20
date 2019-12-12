class ContactsMailer < ApplicationMailer

  def new_contact_message(contact)
    @contact = contact
    mail(
      to: "sian.m.stone@gmail.com",
      subject: "You Have a Message From Your Website",
      body: "something")
  end

end
