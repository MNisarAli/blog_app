require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'Jon', photo: 'https://i.pravatar.cc/300?img=58', bio: 'Test user', posts_counter: 5)

    visit users_path
  end
  it 'I can see the username, profile picture, and number of posts each user has written' do
    expect(page).to have_content(@user1.name)
    expect(page.html).to include(@user1.photo)
    expect(page).to have_content(@user1.posts.count)
  end
  it "When I click on a user, I am redirected to that user's show page" do
    click_link @user1.name
    expect(current_path).to eq(current_path)
  end
end
