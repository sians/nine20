class Image < ApplicationRecord
  belongs_to :media
  belongs_to :issue
  belongs_to :user
end
