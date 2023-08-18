require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:user) {User.new(name: "Nouridine", photo: "myphoto", bio: "This is my bio", posts_count: 0)}
  let (:post) {Post.new(title: "The importance of TDD", text: "the text", author: user)}

  it "Title must not be blank." do
    post.title = ""
    expect(post).not_to be_valid
  end
  it "Title must not exceed 250 characters." do
    post.title = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    expect(post).not_to be_valid
  end
  it "CommentsCounter must be an integer greater than or equal to zero." do
    post.comments_count = -1
    expect(post).not_to be_valid
  end
  it "LikesCounter must be an integer greater than or equal to zero." do
    post.likes_count = -1
    expect(post).not_to be_valid
  end
end
