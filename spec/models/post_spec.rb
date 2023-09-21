require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it 'requires title to be present' do
      post = Post.new(author: nil, title: '', text: 'This is a post', comments_counter: 0, likes_counter: 0)

      expect(post.valid?).to be_falsey
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'requires title to be maximum 250 characters long' do
      post = Post.new(author: nil, title: 'x' * 251, text: 'This is a post', comments_counter: 0, likes_counter: 0)

      expect(post.valid?).to be_falsey
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'requires comments_counter to be a non-negative integer' do
      post = Post.new(author: nil, title: 'My Post', text: 'This is a post', comments_counter: -1, likes_counter: 0)

      expect(post.valid?).to be_falsey
      expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end

    it 'requires likes_counter to be a non-negative integer' do
      post = Post.new(author: nil, title: 'My Post', text: 'This is a post', comments_counter: 0, likes_counter: -1)

      expect(post.valid?).to be_falsey
      expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end
end
