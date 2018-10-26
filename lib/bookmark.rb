require_relative 'database_connection'
require_relative './comment'
require_relative './tag'
# Bookmark
class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    bookmarks = DatabaseConnection.query("SELECT * FROM bookmarks")
    bookmarks.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    result = result.first
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
    result = result.first
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
    result = result.first
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end

  def self.where(tag_id:)
    result = DatabaseConnection.query("SELECT id, url, title FROM bookmarks_tags INNER JOIN bookmarks ON bookmarks.id = bookmarks_tags.bookmark_id WHERE tag_id = '#{tag_id}';")
    result.map do |bookmark|
      Bookmark.new(
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url']
      )
    end
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

  def tags(tag_class = Tag)
    tag_class.where(bookmark_id: id)
  end

  private

  def self.is_url?(url)
    url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
