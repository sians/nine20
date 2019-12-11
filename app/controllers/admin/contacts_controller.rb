class Admin::ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contacts = policy_scope(Contact).order(created_at: :desc)
    @unread_contacts = policy_scope(Contact).where(read: false).order(created_at: :desc)

  end
end
