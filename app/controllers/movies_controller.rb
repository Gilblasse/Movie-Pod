class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(move_params)
    if @movie.save
      redirect_to '/',success: "Your Video Was Successfully Added"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end


  private 

  def move_params 
    params.require(:movie).permit(:title,:description,:image,:video)
  end 

end
