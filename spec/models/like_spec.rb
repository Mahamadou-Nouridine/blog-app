require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Nouridine', photo: 'myphoto', bio: 'This is my bio', posts_count: 0) }
  let(:post) { Post.new(title: 'The importance of test', text: 'the content', author: user, likes_count: 0, comments_count: 0) }

  it 'Should update the likes_count in post' do
    Like.create(post:, author: user)
    expect(post.likes.count).to eq(1)
  end
end
