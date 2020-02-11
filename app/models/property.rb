class Property < ApplicationRecord
  belongs_to :host
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  has_many_attached :images


  def self.search(query)
    Property.where("title LIKE ? OR description LIKE ? OR city LIKE ? OR state LIKE ?", "%#{query}%", "%#{query}%","%#{query}%","%#{query}%")
  end







end
