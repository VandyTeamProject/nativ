class Place < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_one :city
  has_many :comments
  has_many :images
  has_many :favorites, dependent: :destroy
  has_many :reviews
  geocoded_by :address
  after_validation :geocode

  
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :image, presence: true

 
  def average_rating
    return 0 if self.reviews.count < 1

    sum = self.reviews.map(&:rating).reduce(:+)
    avg = sum / self.reviews.count.to_f
  end

  def average_rating_half_starred
    self.average_rating % 1 == 0 ? 0 : 1
  end

  def average_rating_unstarred
    5 - self.average_rating.floor - self.average_rating_half_starred
  end

end
