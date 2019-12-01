class MediasController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :get_media, only: %i[show edit update]
  before_action :get_issue, only: %i[show new create]

  def show

  end

  def new
    @media = Media.new
    authorize @media
  end

  def create
    @media = Media.new(media_params)
    @media.issue = @issue
    authors = params[:media][:user_ids].map do |user_id|
      User.find(user_id) unless user_id.empty?
    end
    authors = authors.reject { |author| author.nil? || author == '' }
    authors.each do |author|
      @media.users << author
    end
    @media.save
    authorize @media

  end

  def edit
  end

  def update
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

  def media_params
    params.require(:media).permit(
      :title,
      :published,
      :minutes,
      :date_published,
      :blurb,
      :content,
      :cover_image,
      :video_url,
      :audio_url,
      :media_type,
      :user_ids
      )
  end


end
