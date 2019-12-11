class Admin::ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_contact, only: [:toggle_read]

  def index
    @contacts = policy_scope(Contact).order(created_at: :desc)
    @unread_contacts = policy_scope(Contact).where(read: false).order(created_at: :desc)
  end

  def toggle_read
    @contact.read = !@contact.read
    @contact.save
    redirect_to admin_inbox_path
  end

  private

  def get_contact
    @contact = Contact.find(params[:id])
    authorize @contact
  end

end
