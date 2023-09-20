require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'requires name to be present' do
      user = User.new(photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.', posts_counter: 0)

      expect(user.valid?).to be_falsey
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'requires posts_counter to be a non-negative integer' do
      user = User.new(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.',
                      posts_counter: -1)

      expect(user.valid?).to be_falsey
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end

  context 'methods' do
    user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.',
                       posts_counter: 0)

    it 'returns the 3 most recent posts' do
      posts = []
      4.times do |i|
        posts << Post.create(author: user, title: "Post#{i + 1}", text: "This is post#{i + 1}", comments_counter: 0,
                             likes_counter: 0)
      end

      expect(user.recent_posts).to eq([posts.last, posts[-2], posts[-3]])
    end
  end
end
