module MoviesHelper

    def genres
        %w(Action Romance Comedy Horror Adventure Thriller Animation Western Drama Musical Biographical Fantasy Parody Mystery Family)
    end

    def movie_link(movie)
        link_to(image_tag(movie.thumbnail), movie_path(movie))
    end
end
