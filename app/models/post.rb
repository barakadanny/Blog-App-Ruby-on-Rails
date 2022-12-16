class Post < ApplicationRecord
  belongs_to :user
  has_many :like
  has_many :comment
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:post_counter)
  end

  def recent_five_comments
    comment.last(5)
  end
end
