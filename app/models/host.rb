class Host < ApplicationRecord
    has_one :user, as: :profile, dependent: :destroy
    has_many :properties
    has_many :reservations, through: :properties
    has_many :guests, through: :reservations




    def guest_profile
        guest ||= Guest.find_by_id(guest_profile_id)
    end

end

