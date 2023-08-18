require 'rails_helper'

RSpec.describe Post, type: :model do
  let (:user) {User.new(name: "Nouridine", photo: "myphoto", bio: "This is my bio", posts_count: 0)}
  let (:post) {User.new(title: "The importance of TDD", text: "the text", author: user)}

  it "Title must not be blank."
  it "Title must not exceed 250 characters."
  it "CommentsCounter must be an integer greater than or equal to zero."
end
