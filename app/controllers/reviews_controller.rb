class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  def show
    id = params[:id]
    @review = Review.find(id)
  end
  def new
    @movie = Movie.find_by_id(params[:movie_id])
    @review = @movie.reviews.build
    @review = Review.new
  end
  def create
    @review = Review.create(review_params)
    @review.moviegoer = @current_moviegoer
    @review.movie = @current_movie
    if @review.save
      flash[:notice] = "Review was successfully saved"
    else
      render 'movies' 
    end
  end
  def review_params
    params.require(:review).permit(:rating, :comments)
  end
end
