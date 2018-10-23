def add_web_bookmarks
  Bookmark.create(url: "http://www.makersacademy.com")
  Bookmark.create(url: "http://www.destroyallsoftware.com")
  Bookmark.create(url: "http://www.google.com")
end
