class IssuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :get_issue, only: %i[show edit update]

  def index
    @issues = policy_scope(Issue).order(created_at: :desc)
  end

  def show
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
