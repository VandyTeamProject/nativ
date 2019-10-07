class Category < ApplicationRecord
    belongs_to :place 

    validates :place_id, uniqueness: { scope: :place_id }
end
