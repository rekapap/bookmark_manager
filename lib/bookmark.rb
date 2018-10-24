require_relative 'dbhelper'
# Bookmark
class Bookmark
  include DBHelper
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = DBHelper.make_connection
    result = connection.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    connection = DBHelper.make_connection
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    result = result[0]
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end
end
