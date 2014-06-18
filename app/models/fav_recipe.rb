class FavRecipe < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :comments
end
