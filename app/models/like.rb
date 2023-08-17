class Like < ApplicationRecord
  belongs_to :author, class_name= 'User'
  belongs_to :author, class_name= 'User'
  after_create :update_counter
  after_destroy :update_counter

  private

  def update_counter
    post.comments_count = post.comments.count
    post.save
  end
end
