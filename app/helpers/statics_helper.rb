module StaticsHelper

    def show_movie_thumbnails(movie)
        render "statics/movie", movie: movie
    end

    
end
