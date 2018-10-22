require 'bookmark'

describe Bookmark do



  describe '#all' do
    subject { described_class }
    it 'returns a list of all bookmarks' do
      expect(subject.all).to eq ['Google', 'Facebook', 'Github']
    end
  end
end
