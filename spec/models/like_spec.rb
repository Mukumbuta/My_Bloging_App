require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.new(name: 'user1', posts_counter: 0)
    @user.save

    @post = Post.new(title: 'post1', text: 'post testing 1', comments_counter: 1, likes_counter: 0, author_id: @user.id)
    @post.save
  end

  subject { Like.create(author: @user, post: @post) }

  it 'likes shoulld be increment by 1' do
    expect(@post.likes_counter).to be_truthy
  end

  it 'cannot update likes count because it is private ' do
    expect(subject).not_to respond_to(:update_likes_count)
  end
end
