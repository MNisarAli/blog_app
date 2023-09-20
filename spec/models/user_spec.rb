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
end
