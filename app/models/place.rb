class Place < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments
  has_many :photos

  # geocoded_by :address
  # after_validation :geocode
  
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
