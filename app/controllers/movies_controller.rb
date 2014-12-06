class MoviesController < ApplicationController
  before_filter :authenticate_moviegoer!
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id]
    @movie = Movie.find(id)
  end
  def new
    @movie = Movie.new
  end
  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    else
      render 'new'
    end
  end
  def movie_params
    params.require(:movie).permit(:rating, :release_date, :title)
  end
  def edit
    @movie = Movie.find params[:id]
  end
  
  def update
    @movie = Movie.find params[:id]
    if @movie.update_attributes(movie_params)
      flash[:notice] = "#{@movie.title} was successfull updated"
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end
  def destroy
    movie = Movie.find params[:id]
    movie.destroy
    flash[:notice] = "#{movie.title} has been deleted"
    redirect_to :action => 'index'
  end
end
