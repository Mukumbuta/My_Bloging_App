require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jon', photo: 'photo.png', bio: 'This is a bio', posts_counter: 0) }

  describe 'mainly validation checks ' do
    it 'name should present' do
      expect(subject).to be_valid
    end

    it 'name should invalid if nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'post counter should be invalid if its non-integer' do
      subject.posts_counter = 'one'
      expect(subject).to_not be_valid
    end

    it 'post counter should be valid if its 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end

    it 'post counter should be invalid if its -1' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'Test methods of User:' do
    it 'User should have no post' do
      post_count = subject.latest_three_posts.count
      expect(post_count).to be(0)
    end
    it 'User should have three latest posts' do
      Post.create(author: subject, title: 'Hello', text: 'This is my first post')
      Post.create(author: subject, title: 'Hello-second', text: 'This is my second post')
      Post.create(author: subject, title: 'Hello-third', text: 'This is my third post')
      Post.create(author: subject, title: 'Hello-fourth', text: 'This is my fourth post')

      post_count = subject.latest_three_posts.count
      expect(post_count).to be_truthy
    end
  end
end
