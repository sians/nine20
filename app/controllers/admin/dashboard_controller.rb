class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @issues = Issue.all.sort_by &:created_at
    @medias = Media.all.sort_by &:created_at
    @unread_contacts = policy_scope(Contact).where(archived: false).where(read: false).order(created_at: :desc)

    # binding.pry
  end
end
