require_relative 'dbhelper'
# Bookmark
class Bookmark
  include DBHelper
  def self.all
    connection = DBHelper.make_connection
    connection.exec('SELECT * from bookmarks').map do |bookmark|
      bookmark['url']
    end
  end

  def self.create(url:)
    connection = DBHelper.make_connection
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end
