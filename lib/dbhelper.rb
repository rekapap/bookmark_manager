require 'pg'
# database helper
module DBHelper
  def self.make_connection
    return PG.connect(dbname: 'bookmark_manager_test') if
      ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'bookmark_manager')
  end
end
