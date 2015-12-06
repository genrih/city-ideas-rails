# encoding: utf-8

class ImageUploader < BaseUploader
  version :preview do
    process :resize_to_fit => [200, 200]
  end
end
