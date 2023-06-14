require 'rails_helper'

RSpec.describe UsersController, type: :request do
  subject { User.new(name: 'user1', photo: 'user photo', bio: 'testing', posts_counter: 5) }

  before { subject.save }

  describe 'GET /index' do
    before(:example) { get users_path }

    it 'returns http success and renders the correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('Here is the lists of all users')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(id: 1) }

    it 'returns http success and renders the correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('Here are the details for a selected user')
    end
  end
end
