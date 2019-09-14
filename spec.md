# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - used sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - used ActiveRecord to store users and movies in a database created by scheme in db folder
- [x] Include more than one model class (e.g. User, Post, Category) - The app has two models: users and movies
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)- User has_many Movies
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)- Movie belongs_to User 
- [x] Include user accounts with unique login attribute (username or email) - Users email must be unique. It will not allow the same email address to be used twice.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying- can create a movie, read a movie, update, and destroy it.
- [x] Ensure that users can't modify content created by other users- Users can only edit or delete their own movies, but may see others' movies.
- [x] Include user input validations- validates that there is a title. I felt this was the most important to include. A user may just want a list of movies they have seen.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)- users will receive error messages if they try to sign up without an email or password, or if the email has already been used. Users will also receive error message if they try to create a movie without a title.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code. - complete

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
