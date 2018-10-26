# Bookmark Manager
 
 ## User Stories
 
 ```
 As a time-pressed user
 So that I can quickly go to web sites I regularly visit
 I would like to see a list of bookmarks
 ```
 
 ```
 As a user
 So I can store bookmark data for later retrieval
 I want to add a bookmark to Bookmark Manager
 ```
 
 ```
 As a user
 So that I can keep my bookmarks relevant
 I want to delete a bookmark
 ```
 
 ```
 As a user
 So that I can keep my bookmarks up to date
I want to edit a bookmark
```
 ```
As a user
So that the bookmarks I save are useful
I want to only save a valid URL
```

```
As a user
So that I can make interesting notes
I want to add a Comment to a Bookmark
```
 
```
As a user
So that I can categorize my bookmarks
I want to add a Tag to a Bookmark
```

```
As a user
So that I can find relevant bookmarks
I want to filter Bookmarks by a Tag
```

```
As a user
So that I can have a personalised bookmark list
I want to sign up with my email address
```

```
As a user
So that I can keep my account secure
I want to sign in with my email and password
```


## How to use
 
### Getting started

To get started with Bookmark Manager:

```
bundle install
rake setup
```

This will give you the application, and set up two databases: `bookmark_manager` for the development environment, and `bookmark_manager_test` for the test environment.

### To run the Bookmark Manager app:
 
 ```
 rackup -p 3000
 ```
 
 To view bookmarks, navigate to `localhost:3000/bookmarks`.
 
### To run tests:
 
 ```
 rspec
 ```
 
### To run linting:
 
 ```
 rubocop
 ```