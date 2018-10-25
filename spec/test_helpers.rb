require 'pg'

def add_web_bookmarks
  bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers Academy')
  Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
  Bookmark.create(url: "http://www.google.com", title: 'Google')
  bookmark
end

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end
