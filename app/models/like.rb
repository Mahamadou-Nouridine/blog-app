class Like < ApplicationRecord
  belongs_to :author, 'User'
  belongs_to :post
  after_create :update_counter
  after_destroy :update_counter

  def update_counter
    post.comments_count = post.comments.count
    post.save
  end
end
