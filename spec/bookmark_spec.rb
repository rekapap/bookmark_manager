require 'bookmark'

describe Bookmark do
  subject(:bookmarks_1) { described_class.new('bookmark_manager') }

  describe '#all' do
    it 'returns a list of all bookmarks' do
      bookmarks = described_class.all
      expect(bookmarks).to include 'http://makers.tech'
      expect(bookmarks).to include 'http://www.destroyallsoftware.com'
      expect(bookmarks).to include 'http://google.com'
    end
  end
end
