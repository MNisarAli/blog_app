require 'rails_helper'
RSpec.describe 'User Show Page', type: :feature do
  describe 'Viewing user show page' do
    before(:each) do
      @user1 = User.create(name: 'User 1',
                           photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
                           bio: 'User from central America.', posts_counter: 0)
      @first_post = Post.create(author: @user1, title: 'post1', text: 'This is my first post', likes_counter: 0,
                                comments_counter: 0)
      @second_post = Post.create(author: @user1, title: 'post2', text: 'This is my second post', likes_counter: 0,
                                 comments_counter: 0)
      @third_post = Post.create(author: @user1, title: 'post3', text: 'This is my third post', likes_counter: 0,
                                comments_counter: 0)
      @fourth_post = Post.create(author: @user1, title: 'post4', text: 'This is my fourth post', likes_counter: 0,
                                 comments_counter: 0)
      visit "/users/#{@user1.id}"
    end
    it 'should show user clicked' do
      expect(page).to have_content(@user1.name)
    end
    it 'should show user photo' do
      expect(page.html).to include(@user1.photo)
    end
    it 'should show user bio' do
      expect(page).to have_content(@user1.bio)
    end
    it 'should show posts_counter of clicked user' do
      expect(page.html).to have_content(@user1.posts_counter)
    end
    it 'should show last three posts only' do
      expect(page).to have_content(@fourth_post.title)
      expect(page).to have_content(@third_post.title)
      expect(page).to have_content(@second_post.title)
    end
    it 'should have a link to see all posts' do
      expect(page.html).to include('See all posts')
    end
    it 'should show next_path when clicked on see all posts' do
      click_on 'See all posts'
      expect(current_path).to eq(current_path)
    end
  end
end
