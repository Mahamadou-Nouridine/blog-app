require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index and /show' do
    let(:person) do
      User.new(
        name: 'Nouridine',
        photo: 'https://drive.google.com/file/d/13-N8SlsasURapsAjgP0D2KTnYtNGBsxO/view?usp=sharing',
        bio: 'Full Stack Web Developer',
        posts_count: 0
      )
    end

    before do
      person.save!
    end

    it 'Get users list page' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'Nouridine'
      expect(response).to have_rendered('index')
    end
    it 'Get user info' do
      get "/users/#{person.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'See all posts'
      expect(response).to have_rendered('show')
    end
  end
end
