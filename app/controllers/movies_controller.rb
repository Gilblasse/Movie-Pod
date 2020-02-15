class MoviesController < ApplicationController
  include MoviesHelper

  def index
    @movies = Movie.query(params[:query])
    if @movies.empty?
      @query_not_found = "There are no matches Found for search term: #{params[:query]}" 
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @similar_movies = @movie.similar_films
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to '/',success: "Your Video Was Successfully Added"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    if @movie.update(movie_params)
        redirect_to @movie.user, success: "#{@movie.title.titleize} was successfully Updated"
    else 
      render :edit
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    user = @movie.user
    title = @movie.title
    @movie.destroy
    redirect_to user, success: "You Successfully DELETED #{@movie.title}"
  end


  private 

  def movie_params 
    params.require(:movie).permit(:title,:description,:image,:video,:genre)
  end 

end
