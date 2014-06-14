class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable


  has_many :comments
  validates :username, uniqueness: true,
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: "username can only contain letters and numbers"}

  validates_presence_of :email

  mount_uploader :image, ImageUploader
end
