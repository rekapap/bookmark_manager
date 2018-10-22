require 'pg'
# Bookmark
class Bookmark
  def self.all
    database = PG.connect(dbname: 'bookmark_manager')
    database.exec('SELECT * from bookmarks').map do |bookmark|
      bookmark['url']
    end
  end
end
