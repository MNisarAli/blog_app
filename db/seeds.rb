# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


first_user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.', posts_counter: 0)
second_user = User.create(name: 'John', photo: 'https://i.pravatar.cc/300?img=68', bio: 'Teacher from Poland.', posts_counter: 0)

first_post = Post.create(author: first_user, title: 'First post', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author: second_user, title: 'Second post', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author: first_user, title: 'Third post', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author: second_user, title: 'Fourth post', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

first_comment = Comment.create(author: second_user, post: first_post, text: 'This is my first comment')
second_comment = Comment.create(author: second_user, post: first_post, text: 'This is my second comment')
third_comment = Comment.create(author: first_user, post: second_post, text: 'This is my first comment')
fourth_comment = Comment.create(author: first_user, post: second_post, text: 'This is my second comment')
fifth_comment = Comment.create(author: second_user, post: third_post, text: 'This is my third comment')
sixth_comment = Comment.create(author: first_user, post: third_post, text: 'This is my third comment')
