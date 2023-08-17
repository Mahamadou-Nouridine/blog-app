class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_create :update_counter
  after_destroy :update_counter

  def recent_comments
    comments.order(:created_at).limit(5)
  end

  private

  def update_counter
    author.posts_count = author.posts.count
    author.save
  end
end
