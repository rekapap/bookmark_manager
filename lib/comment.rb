require_relative './database_connection'

class Comment
  attr_reader :id, :text, :bookmark_id

  def initialize(id:, text:, bookmark_id:)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end

  def self.create(bookmark_id:, text:)
    result = DatabaseConnection.query("INSERT INTO comments (bookmark_id, text) VALUES ('#{bookmark_id}','#{text}') RETURNING id, text, bookmark_id;").first
    Comment.new(
      id: result['id'],
      text: result['text'],
      bookmark_id: result['bookmark_id']
    )
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{bookmark_id};")
    result.map do |comment|
      Comment.new(
        id: comment['id'],
        text: comment['text'],
        bookmark_id: comment['bookmark_id']
      )
    end
  end
end
