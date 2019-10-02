class Place < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_one :city
  has_many :comments
  has_many :images
  has_many :favorite_places
  has_many :favorited_by, through: :favorite_places, source: :user
  geocoded_by :address
  after_validation :geocode

  
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :image, presence: true


end
