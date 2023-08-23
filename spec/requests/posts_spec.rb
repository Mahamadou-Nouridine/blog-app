require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index and /show' do
    it 'get the root page' do
      get '/users/12/posts'
      expect(response).to have_rendered('index')
      expect(response.body).to include 'Pagination'
      expect(response).to have_http_status(:success)
    end
    it 'get post details' do
      get '/users/12/posts/12'
      expect(response).to have_rendered('show')
      expect(response.body).to include 'Post #1 by username'
      expect(response).to have_http_status(:success)
    end
  end
end
