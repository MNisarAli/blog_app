require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('List of all users')
    end
  end

  describe 'GET /show' do
    user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 0)

    before(:example) { get user_path(user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('Here are the details for a selected user')
    end
  end
end
