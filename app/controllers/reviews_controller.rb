class ReviewsController < ApplicationController
  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @review = @movie.reviews.build
  end

  def create
    @movie = Movie.find_by(id: review_params[:movie_id])
    @review = @movie.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to movie_path(@movie),success: "You Successfull Reviewed the movie #{@movie.title.titleize}"
    else
      render :new
    end
  end




  private 

  def review_params
    params.require(:review).permit(:comment,:movie_id)
  end
end
