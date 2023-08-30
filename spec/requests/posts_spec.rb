require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index and /show' do
    let(:person) do
      User.new(
        name: 'Nouridine',
        photo: 'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing',
        bio: 'Full Stack Web Developer',
        posts_count: 0
      )
    end

    let(:first_post) do
      Post.create(
        author: person,
        title: 'A Post',
        text: 'Post containing nothing',
        likes_count: 0,
        comments_count: 0
      )
    end

    before do
      person.save!
      first_post
    end

    it 'get the root page' do
      get "/users/#{person.id}/posts"
      expect(response).to have_rendered('index')
      expect(response.body).to include 'New post'
      expect(response).to have_http_status(:success)
    end
    it 'get post details' do
      get "/users/#{person.id}/posts/#{first_post.id}"
      expect(response).to have_rendered('show')
      expect(response.body).to include 'A Post by Nouridine'
      expect(response).to have_http_status(:success)
    end
  end
end
