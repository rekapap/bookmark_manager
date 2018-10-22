require 'sinatra/base'
require './lib/bookmark'
# Bookmark Manager class
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $PROGRAM_NAME
end
