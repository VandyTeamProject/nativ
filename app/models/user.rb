class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_many :places
  has_many :comments
  has_many :favorites, dependent: :destroy

  has_many :reviews 
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end   

  def favorite!(place)
    self.favorites.create!(place_id: place.id)
  end

  def unfavorite!(place)
    favorite = self.favorites.find_by(place_id: place.id)
    favorite.destroy!
  end

  def favorite?(place)
    self.favorites.find_by(place_id: place.id)
  end

end
