class Place < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_one :city
  has_many :comments
  has_many :images
  has_many :reviews
  geocoded_by :address
  after_validation :geocode

  
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :image, presence: true

end
