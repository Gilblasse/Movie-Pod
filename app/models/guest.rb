class Guest < ApplicationRecord
    has_one :user, as: :profile, dependent: :destroy
    has_many :reservations
    has_many :properties, through: :reservations
    has_many :hosts, through: :properties
    has_many :reviews, through: :reservations
end
