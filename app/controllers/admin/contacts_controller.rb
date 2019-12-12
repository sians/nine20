class Admin::ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_contact, only: [:toggle_read, :toggle_archived]

  def index
    @partial = whitelisted_partial
    @contacts = policy_scope(Contact).where(archived: false).order(created_at: :desc)
    @unread_contacts = policy_scope(Contact).where(archived: false).where(read: false).order(created_at: :desc)
    @archived_contacts = policy_scope(Contact).where(archived: true).order(created_at: :desc)
  end

  def toggle_read
    @contact.read = !@contact.read
    @contact.save
    redirect_to admin_inbox_path
  end

  def toggle_archived
    @contact.archived = !@contact.archived
    @contact.save
    redirect_to admin_inbox_path
  end

  private

  def get_contact
    @contact = Contact.find(params[:id])
    authorize @contact
  end

  def whitelisted_partial
    if params[:view] == 'archived'
      'admin/contacts/archived'
    else
      'admin/contacts/unarchived'
    end
  end

end
