require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index and /show" do
    it 'Get users list page' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response).to have_rendered('index')
    end
    it 'Get user info' do
      get '/users/12'
      expect(response).to have_http_status(:success)
      expect(response).to have_rendered('show')
    end
  end
end
