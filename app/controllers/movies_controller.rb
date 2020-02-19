class MoviesController < ApplicationController
  include MoviesHelper
  before_action :authorize?, only: [:new,:edit,:destroy]
  before_action :auth_set_movie, only: [:edit,:update,:destroy]
  before_action :set_movie, only: [:show]

  def index
    @movies = Movie.query(params[:query])
    if @movies.empty?
      @query_not_found = "There are no matches Found for search term: #{params[:query]}" 
    end
  end

  def show
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
  end

  def update
    if @movie.update(movie_params)
        redirect_to @movie.user, success: "#{@movie.title.titleize} was successfully Updated"
    else 
      render :edit
    end
  end

  def destroy
    user = @movie.user
    title = @movie.title
    @movie.destroy
    redirect_to user, success: "You Successfully DELETED #{@movie.title}"
  end






  private 

  def movie_params 
    params.require(:movie).permit(:title,:description,:image,:video,:genre)
  end 

  def auth_set_movie 
    @movie = Movie.find_by(id: params[:id])
    if @movie
      if current_user.movies.include?(@movie)
        @movie
      else 
        flash[:danger] = 'Your not Authorized To Access This Movie'
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger] = "Movie Doesn't Exist"
      redirect_back(fallback_location: root_path)
    end
  end

  def set_movie 
    @movie = Movie.find_by(id: params[:id])
    if @movie
      @movie
    else
      flash[:danger] = "Movie Doesn't Exist"
      redirect_back(fallback_location: root_path)
    end
  end

end
