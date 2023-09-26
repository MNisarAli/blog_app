require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 0)

  describe 'GET /index' do
    before(:example) { get user_posts_path(user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end
  end
end
