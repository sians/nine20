class Admin::IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_issue, only: %i[edit update]
  before_action :get_unread_contacts

  def index
    @issues = policy_scope(Issue).order(created_at: :desc)
  end

  def new
    @issue = Issue.new
    authorize @issue
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.save
    authorize @issue
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      redirect_to admin_path
    else
      render 'admin/issues/edit'
    end
  end

  private

  def get_issue
    @issue = Issue.find(params[:id])
    authorize @issue
  end

  def issue_params
    params.require(:issue).permit(:title, :cover_image, :issue_number)
  end

  def get_unread_contacts
    @unread_contacts = policy_scope(Contact).where(read: false).order(created_at: :desc)
  end
end
