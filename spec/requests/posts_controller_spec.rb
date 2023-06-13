require 'rails_helper'

RSpec.describe PostsController, type: :request do
  user = User.create(name: 'user1', photo: 'user photo', bio: 'testing', posts_counter: 5)
  subject do
    Post.new(title: 'post1', text: 'first post', comments_counter: 5, likes_counter: 5, author: user)
  end

  before { subject.save }

  describe 'GET /index' do
    before(:each) { get user_posts_path(user_id: 1) }

    it 'returns http success and renders the correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_post_path(user_id: 1, id: 1) }

    it 'returns http success and renders the correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('Here is the details of a specific post for a given user')
    end
  end
end
