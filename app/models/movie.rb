class Movie < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_one_attached :video
    validates :title, :description, presence: true 
    validates :description, length: { minimum: 25 }
    validate :image_type
    validate :video_type


    def image_type
        if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
            errors.add(:image, "Must be of file types JPEG or PNG") 
        elsif !image.attached? 
            errors.add(:image, "Must have a Picture attached")            
        end
    end

    def video_type
        if video.attached? && !video.content_type.in?(%w(video/mp4))
            errors.add(:video, "Must be of file type MP4") 
        elsif !video.attached? 
            errors.add(:video, "Must have a Vidoe attached")            
        end
    end

    def thumbnail 
        image.variant(resize: '300x300!').processed 
    end

end
