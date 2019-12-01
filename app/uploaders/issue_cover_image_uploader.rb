class IssueCoverImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
