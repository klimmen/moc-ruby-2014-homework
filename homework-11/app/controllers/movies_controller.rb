class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  def show
  end

  # GET /movies/new
  def new
    @genres = Genre.all
  end

  # GET /movies/1/edit
  def edit
     @genres = Genre.all
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    genre_params.each_value do |genre_id| 
      @genre_movie_serial = GenreMovieSerial.new
      @genre_movie_serial.resource = @movie
      @genre_movie_serial.genre_id = genre_id
      @genre_movie_serial.save
    end
    redirect_to movie_path(@movie)
  end

  # PATCH/PUT /movies/1
  def update
    @movie.update(movie_params)
    @movie.genre_movie_serial.all.delete_all
    genre_params.each_value do |genre_id|
      @genre_movie_serial = GenreMovieSerial.new
      @genre_movie_serial.resource = Movie.find_by movie_params
      @genre_movie_serial.genre_id = genre_id
      @genre_movie_serial.save
    end
    redirect_to @movie
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end
    
    def genre_id
      genres_id = {}
      params[:movie_genre].each do |key, value|
       if !key.slice("genre").nil?
         genres_id[key] = value
       end
      end
      genres_id
    end

    def movie_params
      params.require(:movie_genre).permit(:name)
    end
    
    def genre_params
      params.require(:movie_genre).permit(*genre_id)
    end
end
