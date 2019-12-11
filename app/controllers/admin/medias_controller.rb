class Admin::MediasController < ApplicationController
  before_action :authenticate_user!
  before_action :get_media, only: %i[edit update destroy]
  before_action :get_unread_contacts

  def index
    @medias = policy_scope(Media).order(updated_at: :asc)
  end

  def new
    @media = Media.new
    authorize @media
  end

  def create
    @media = Media.new(media_params)
    authorize @media

    if @media.save
      redirect_to admin_medias_path
    else
      render 'admin/medias/new'
    end
  end

  def edit
  end

  def update
    if @media.update(media_params)
      redirect_to admin_medias_path
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
      :cover_image_cache,
      :video_url,
      :audio_url,
      :media_type,
      :issue_id,
      { :user_ids => [] }
      )
  end

  def get_unread_contacts
    @unread_contacts = policy_scope(Contact).where(read: false).order(created_at: :desc)
  end


end
