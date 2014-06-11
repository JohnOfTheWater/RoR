class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable


  has_many :comments
  validates :username, uniqueness: true
  mount_uploader :image, ImageUploader
end
