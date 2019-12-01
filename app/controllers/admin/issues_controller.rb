class Admin::IssuesController < ApplicationController
  before_action :authenticate_user!

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
  end

  private

  def get_issue
    @issue = Issue.find(params[:id])
    authorize @issue
  end

  def issue_params
    params.require(:issue).permit(:title, :cover_image, :issue_number)
  end
end
