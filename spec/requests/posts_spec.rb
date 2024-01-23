require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 0)
  post = Post.create(author: user, title: 'Test post', text: 'Test text', comments_counter: 1, likes_counter: 2)

  describe 'GET /index' do
    before(:example) { get user_posts_path(user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Recent Comments')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(user, post) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Comments')
    end
  end
end
