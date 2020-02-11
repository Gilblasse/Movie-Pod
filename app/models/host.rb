class Host < ApplicationRecord
    has_one :user, as: :profile, dependent: :destroy
    has_many :properties
    has_many :reservations, through: :properties
    has_many :guests, through: :reservations
end
