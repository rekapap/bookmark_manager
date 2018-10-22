class Bookmark
  @all = ['Google', 'Facebook', 'Github']
  def self.all
    @all.dup
  end
end
