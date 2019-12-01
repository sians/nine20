class Issue < ApplicationRecord
  has_many :medias

  mount_uploader :cover_image, IssueCoverImageUploader

end
