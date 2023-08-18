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

  it 'Recent_comments should return the 5 latest comments' do
    post.comments.new(author: user, text: "comment1", post: post)
    post.comments.new(author: user, text: "comment2", post: post)
    post.comments.new(author: user, text: "comment3", post: post)
    post.comments.new(author: user, text: "comment4", post: post)
    post.comments.new(author: user, text: "comment5", post: post)
    post.comments.new(author: user, text: "comment6", post: post)
    post.comments.new(author: user, text: "comment7", post: post)
    comments = post.recent_comments.map do |comment|
      comment.text
    end
    expect(comments).to eq(['comment7', 'comment6', 'comment5', 'comment4', 'comment3'])
  end
end
