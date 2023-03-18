class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comments_count

  private

  def update_comments_count
    post.increment!(:comments_counter)
  end

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
