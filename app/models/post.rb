class Post < ApplicationRecord
  belongs_to :user
  has_many :like
  has_many :comment

  def recent_five_posts
    posts.last(5)
  end

  def update_posts_counter
    user.increment!(:post_counter)
  end
end
