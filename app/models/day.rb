class Day < ActiveRecord::Base
  #mount_uploader :image, ImageUploader
  belongs_to :week
end
