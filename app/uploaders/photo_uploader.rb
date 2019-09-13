class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :resized do
    process :resize_to_fit => [500, 10000]
  end
end
