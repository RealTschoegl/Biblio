
class Book < ActiveRecord::Base
  attr_accessible :author, :isbn, :published, :title, :picture

  mount_uploader :picture, PictureUploader

  belongs_to :user

  before_save :goodreads_assist

  def goodreads_assist
    client = Goodreads.new

    if !self.isbn.blank?
      search_isbn = self.isbn
    end

    if self.picture.blank?
      self.current_path = client.book_by_isbn(search_isbn)[:image_url]
    end

    if self.title.blank?
      self.title = client.book_by_isbn(search_isbn)[:title]
    end 

    if self.author.blank?
      self.author = client.book_by_isbn(search_isbn)[:authors][:author][:name]
    end

    if self.published.blank?
      self.published = client.book_by_isbn(search_isbn)[:publication_year]
    end

  end

end
