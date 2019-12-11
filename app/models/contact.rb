class Contact < ApplicationRecord
  validates :email,
    :presence => :true,
    :format => {
      :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      :message => "must be a valid email address"
    }
  validates :message, :name, :presence => :true

  def get_unread
    @contacts = self.contacts.map do |contact|
      contact unless contact.read
    end
    @contacts.reject { |item| item.nil? || item == '' }
  end

end
