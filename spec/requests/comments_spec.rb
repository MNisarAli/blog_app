require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 0)
  post = Post.create(author: user, title: 'Test post', text: 'Test text', comments_counter: 1, likes_counter: 2)
  Comment.create(post:, author: user, text: 'Test comment')

  describe 'GET /new' do
    before(:example) { get new_user_post_comment_path(user, post) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
