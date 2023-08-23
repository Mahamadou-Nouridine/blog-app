# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user1 = User.create(name: "Nouridine", photo: "https://avatars.githubusercontent.com/u/98597449?v=4", bio: "Rails developer")
# user2 = User.create(name: "Mahamadou", photo: "https://avatars.githubusercontent.com/u/98597449?v=4", bio: "MERN developer")
#  users = User.all



# post = Post.create(title: "Rails seeding guide", text: "rails seeding guide description", author_id: users[0].id)
# users[1].likes.create(post_id: post.id)
# users[1].comments.create(post_id: post.id, text: "I like this article")
require 'faker'

10.times do
  User.create(
    name: Faker::Name.name,
    photo: Faker::Avatar.image,
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    posts_count: 0
  )
end

50.times do
  Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    text: Faker::Lorem.paragraph(sentence_count: 2),
    author_id: User.all.sample.id,
    likes_count: 0,
    comments_count: 0
  )
end

100.times do
  Comment.create(
    text: Faker::Lorem.paragraph(sentence_count: 2),
    author_id: User.all.sample.id,
    post_id: Post.all.sample.id
  )
end
