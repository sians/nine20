class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

  def news
  end

end
