class Admin::MediasController < ApplicationController
  before_action :authenticate_user!
  before_action :get_media, only: %i[edit update destroy]

  def index
    @medias = policy_scope(Media).order(created_at: :desc)
  end

  def new
    @media = Media.new
    authorize @media
  end

  def create
    @media = Media.new(media_params)
    @issue = Issue.find(params[:media][:issue_id])
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
    @issue = Issue.find(params[:media][:issue_id])
    @media.issue = @issue
    updated_authors = params[:media][:user_ids].map do |user_id|
      User.find(user_id) unless user_id.empty?
    end
    updated_authors = updated_authors.reject { |author| author.nil? || author == '' }
    users_medias = UsersMedia.where(media_id: @media.id)
    users_medias.each { |users_media| users_media.delete }
    updated_authors.each { |author| @media.users << author }
    if @media.update(media_params)
      redirect_to admin_path
    else
      render 'admin/medias/edit'
    end
  end

  def destroy
    users_medias = UsersMedia.where(media_id: @media.id)
    users_medias.each {|users_media| users_media.delete}
    if @media.delete
      redirect_to admin_path, notice: 'deleted!'
    else
      redirect_to admin_path, notice: 'something went wrong!'
    end
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
