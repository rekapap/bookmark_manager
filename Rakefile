require 'pg'

task :test_database_setup do
  
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the database
  connection.exec("TRUNCATE bookmarks, comments, tags, bookmarks_tags, users;")
end

task :setup do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE bookmarks (id SERIAL PRIMARY KEY, url VARCHAR(60));")
    connection.exec("ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);")
    connection.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));")
    connection.exec("CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60));")
    connection.exec("CREATE TABLE bookmarks_tags(tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));")
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(100), email VARCHAR(60), password VARCHAR(140));")
  end
end
