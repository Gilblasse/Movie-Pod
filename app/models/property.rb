class Property < ApplicationRecord
  belongs_to :host
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  has_many_attached :images
  validate :image_type


  def self.search(query)
    Property.where("title LIKE ? OR description LIKE ? OR city LIKE ? OR state LIKE ?", "%#{query}%", "%#{query}%","%#{query}%","%#{query}%")
  end



  private 
  def image_type
    if images.attached? == false 
      errors.add(:image, "are missing!")
    end 
    images.each do |image| 
      if !image.content_type.in?(%('image/jpeg image/png))
        errors.add(:image, "needs to be PNG or JPEG")
      end
    end
  end






end
