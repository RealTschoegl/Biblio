
class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :published, :title, :picture

  mount_uploader :picture, PictureUploader

  before_save :goodreads_assist

  def goodreads_assist
    client = Goodreads.new
    if :author.blank?
      :author = client.book_by_isbn('search_isbn')[:author]
    else
    end

  #   if !:isbn.blank?
  #     search_isbn = :isbn
  #   elsif :picture.blank?
  #     :picture = client.book_by_isbn('search_isbn')[:image_url]
  #   elsif :title.blank?
  #     :title = client.book_by_isbn('search_isbn')[:title]
  #   elsif :author.blank?
  #     :author = client.book_by_isbn('search_isbn')[:author]
  #   elsif :published.blank?
  #     :published = client.book_by_isbn('search_isbn')[:publication_year]
  #   else 
  #     raise 'Your before_create function shat itself.'
  #   end 
  end

  belongs_to :user

end
