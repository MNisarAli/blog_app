require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'Viewing User Show page' do
    before(:each) do
      @user1 = User.create(name: 'Jon', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 1)

      @post = Post.create(author: @user1, title: 'Test post', text: 'Post text', comments_counter: 0, likes_counter: 0)

      @comment = Comment.create(post: @post, author: @user1, text: 'Hi, this is a comment')

      visit "/users/#{@user1.id}/"
    end

    it "displays the user's profile picture" do
      expect(page).to have_selector('img[alt="User photo"]')
    end

    it "displays the user's username" do
      expect(page).to have_content(@user1.name)
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content(@user1.posts_counter)
    end

    it "should show the user's bio" do
      expect(page).to have_content(@user1.bio)
    end

    it "displays the user's first 3 posts" do
      Post.create(
        [
          {
            author: @user1, title: 'First Post', text: 'My first post'
          },
          {
            author: @user1, title: 'Second Post', text: 'My Second post'
          },
          {
            author: @user1, title: 'Third Post', text: 'My Third post'
          }
        ]
      )
      page.has_content?(@user1.posts)
    end

    it 'should have a button to view all of a user posts' do
      expect(page).to have_link('See all posts')
    end

    it 'should redirect to post show page when clicking on post.' do
      click_link @post.title
      expect(page).to have_current_path(user_post_path(@user1, @post))
    end

    it 'should redirect to user posts index page when clicking on see all posts.' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user1))
    end

    it 'should show comments counter' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'should show likes counter' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'should show name of commenter' do
      expect(page).to have_content(@comment.author.name)
    end
  end
end
