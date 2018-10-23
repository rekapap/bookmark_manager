require 'bookmark'

describe Bookmark do
  subject(:bookmarks_1) { described_class.new('bookmark_manager') }

  describe '#all' do
    it 'returns a list of all bookmarks' do
      add_web_bookmarks
      bookmarks = described_class.all
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'http://www.destroyallsoftware.com'
      expect(bookmarks).to include 'http://www.google.com'
    end
  end

  describe '.create' do

    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end
    
  end
end
