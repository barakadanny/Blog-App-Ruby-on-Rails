require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'test',
      photo: 'https://test.com/profile.png',
      bio: 'I am test running.',
      post_counter: 0
    )
  end

  before { subject.save }

  context 'Return valid data' do
    it 'should accept the name' do
      subject.name = 'test'
      expect(subject).to be_valid
    end

    it 'should accept post_counter' do
      subject.post_counter = 3
      expect(subject).to be_valid
    end
  end

  context 'Return invalid data' do
    it 'should not accept blank name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not accept negative post_counter' do
      subject.post_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should not accept non numerical post_counter' do
      subject.post_counter = 'count'
      expect(subject).to_not be_valid
    end
  end

  context 'Return recent three post' do
    it 'should return the recent three post' do
      3.times do
        Post.create(
          title: 'Post',
          text: 'It is valid',
          likes_counter: 0,
          comments_counter: 2
        )
      end
      expect(Post.last(3).count).to eq(3)
    end
  end
end
