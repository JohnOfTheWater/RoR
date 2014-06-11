class Comment < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :user

  validates_presence_of :comment
  validates_presence_of :recipe
  validates_presence_of :user

  default_scope -> { order('created_at ASC') }
end
