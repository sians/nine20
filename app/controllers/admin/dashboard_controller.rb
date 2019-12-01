class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @issues = Issue.all.sort_by &:created_at
    @medias = Media.all.sort_by &:created_at
    # binding.pry
  end
end
