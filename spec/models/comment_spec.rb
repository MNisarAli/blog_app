require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'methods' do
    user = User.create(name: 'Tom', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    post = Post.create(author: user, title: 'My Post', text: 'This is a post', comments_counter: 0, likes_counter: 0)
    comment = Comment.create(post:, author: user, text: 'This is a comment')

    describe '#update_comments_counter' do
      it 'does not update the comments counter if the post is not changed' do
        expect { comment.update(text: 'Updated Comment') }.not_to(change { post.reload.likes_counter })
      end
    end
  end
end
