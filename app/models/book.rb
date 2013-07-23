
class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :published, :title, :picture

  mount_uploader :picture, PictureUploader

  belongs_to :user
end
