class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :comments 

  RATINGS = {
     'one star': 1,
    'two stars': 2,
    'three stars': 3,
    'four stars': 4,
    'five stars': 5
  }

  def unstarred
    5-self.rating.to_i
  end
  
end
