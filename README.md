# Bookmark Manager App

### User stories

```
As an internet user,
So I can see my favourite websites,
I would like to view a list of my bookmarks.
```

### Setup instructions

1. Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases.

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

2. To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

 ```
 rackup -p 3000
 ```
 
3. To view bookmarks, navigate to `localhost:3000/bookmarks`.
 
 ### To run tests:
 
 ```
 rspec
 ```
 
 ### To run linting:
 
 ```
 rubocop
 ```
