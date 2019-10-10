class Favorite < ApplicationRecord
    belongs_to :place 
    belongs_to :user

    validates :user_id, uniqueness: { scope: :place_id }
end
