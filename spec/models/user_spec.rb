require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) {User.new(name: "Nouridine", photo: "myphoto", bio: "This is my bio", posts_count: 0)}
  it "Name has a value" do
    expect(user).to be_valid
  end
  it "Name must not be blank." do
    user.name = ""
    expect(user).not_to be_valid
  end
  it "posts_count should not be negative" do
    user.posts_count = -1
    expect(user).not_to be_valid
  end
  it "posts_count should be an integer" do
    user.posts_count = "nothing"
    expect(user).not_to be_valid
  end

  it "Recent post method" do
    user.posts.new(title: "The first post", text: "the text")
    user.posts.new(title: "The second post", text: "the text")
    user.posts.new(title: "The third post", text: "the text")
    user.posts.new(title: "The fourth post", text: "the text")
    user.posts.new(title: "The fifth post", text: "the text")
    expect(user.recent_post[0].title).to eq('The fifth post')
    expect(user.recent_post[1].title).to eq('The fourth post')
    expect(user.recent_post[2].title).to eq('The third post')
    expect(user.recent_post.length).to eq(3)
  end
end
