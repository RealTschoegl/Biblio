class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :published, :title
end
