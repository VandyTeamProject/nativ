class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :comments, presence: true, length: { maximum: 140, minimum: 3 }
end
