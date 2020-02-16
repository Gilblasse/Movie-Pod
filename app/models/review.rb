class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :movie
    validates :stars, :comment, presence: true 
    
end
