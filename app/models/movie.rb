class Movie < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_one_attached :image
    has_one_attached :video
    validates :title, :description, presence: true 
    validates :title, uniqueness: true
    validates :description, length: { minimum: 25 }
    validates :genre, inclusion: { in: %w(Action Romance Comedy Horror Adventure Thriller Animation Western Drama Musical Biographical Fantasy Parody Mystery Family), message: "%{value} is not a valid Genre" }
    validate :image_type
    validate :video_type


    def self.query(search)
        where("title LIKE ? OR genre LIKE ?", "%#{search}%", "%#{search}%")
    end

    def rating
       avg = Movie.where("title = ?", title).joins(:reviews).where("stars > ?",0).average(:stars)
       avg.to_i
    end

    def similar_films
        Movie.where("genre = ?", self.genre).where.not(title: self.title)
    end

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
        image.variant(resize: '300x450!').processed 
    end

end
