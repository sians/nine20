class Media < ApplicationRecord
  belongs_to :issue
  has_many :users_medias
  has_many :users, through: :users_medias

  mount_uploader :cover_image, MediaCoverImageUploader

  validates :title, presence: true, allow_blank: false
  validates :issue_id, :media_type, :users, presence: true

end
