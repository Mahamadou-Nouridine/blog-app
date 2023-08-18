class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 250}
  validates :likes_count, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_count, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_create :update_counter
  after_destroy :update_counter

  def recent_comments
    comments.last(5).reverse
  end

  private

  def update_counter
    author.posts_count = author.posts.count
    author.save
  end
end
