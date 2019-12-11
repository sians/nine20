class ContactsMailer < ActionMailer::Base
  default from: "sian.m.stone@gmail.com"

  def general_message(contact)
    @contact = contact
    mail(
      :to => "sian.m.stone@gmail.com",
      :subject => "You Have a Message From Your Website",
      :body => "something")
  end

end
