class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave unless development? || test?

end
