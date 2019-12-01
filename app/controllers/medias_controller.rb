class MediasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :get_media, only: %i[show]
  before_action :get_issue, only: %i[show]

  def show
  end


  def destroy
  end

  private

  def get_media
    @media = Media.find(params[:id])
    authorize @media
  end

  def get_issue
    @issue = Issue.find(params[:issue_id])
    authorize @issue
  end
end
